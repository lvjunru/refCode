//
//  EStreamPresenter.m
//  PIXY
//
//  Created by gao feng on 16/4/26.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamPresenter.h"
#import "DBConst.h"
#import "ChannelMessage.h"
#import "GiftChannelMessage.h"
#import "EStreamPresenter+Gift.h"
#import "LikeChannelMessage.h"
#import "IStreamView.h"
#import "EServiceEventUtil.h"

@interface EStreamPresenter ()
@property (nonatomic, strong) NSTimer*                              testTimer;
@property (nonatomic, strong) NSMutableDictionary*                  giftDic;

@end

@implementation EStreamPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self observeTable:Table_ChannelMessage event:Event_RowInsert selector:@selector(detectTableChannelMessageInsert:)];
        
        [self prepareGiftQueue];
        
        self.giftDic = @{}.mutableCopy;
    }
    return self;
}

#pragma mark- detect db table changes

- (void)detectTableChannelMessageInsert:(id)data
{
    ChannelMessage* msg = data;
    if (msg == nil) {
        return;
    }

    //play animation for gift message
    if (msg.msgtype.intValue == kChannelMsgType_Gift) {
        [self onReceiveGiftMsg:msg];
        return;
    }
    
    
    //play heart animation
    if (msg.msgtype.intValue == kChannelMsgType_Like) {
        LikeChannelMessage* likeMsg = (LikeChannelMessage*)msg;
        C(self.context.view, IStreamView, fireHeartWithColorId:likeMsg.colorId);
        return;
    }
}

static int tapACount = 0;
static int tapBCount = 0;

- (void)startTest
{
    //test receive gift
    tapACount = 0;
    tapBCount = 0;
    self.testTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTestTimerTimeout) userInfo:nil repeats:true];
}

- (void)stopTest
{
    [self.testTimer invalidate];
    self.testTimer = nil;
}



- (void)onTestTimerTimeout
{
//    //test gift
//    GiftChannelMessage* channelMsg = [GiftChannelMessage new];
//    channelMsg.msgtype = @(kChannelMsgType_Gift);
//    channelMsg.giftType = GiftChannelMessage_Star;
//    
//    static int uid = 0;
//    uid = uid%2;
//    uid++;
//    
//    channelMsg.fromuid = @(uid);
//    channelMsg.fromnickname = [NSString stringWithFormat:@"User %d", uid];
//    if (uid == 0) {
//        channelMsg.tapCount = tapACount++;
//    }
//    else
//    {
//        channelMsg.tapCount = tapBCount++;
//    }
//    [EServiceEventUtil postNotification:Table_ChannelMessage withEvent:Event_RowInsert withData:channelMsg];
    
    
    //test heart
    LikeChannelMessage* likeMsg = [LikeChannelMessage new];
    likeMsg.fromuid = @(0);
    
    static int colorId = 0;
    colorId ++;
    colorId = colorId % 6;
    likeMsg.colorId = @(colorId);
    
    [EServiceEventUtil postNotification:Table_ChannelMessage withEvent:Event_RowInsert withData:likeMsg];
}

- (void)sendGiftWithIndex:(int)index
{
    GiftChannelMessage* channelMsg = [GiftChannelMessage new];
    channelMsg.msgtype = @(kChannelMsgType_Gift);
    channelMsg.giftType = index;

    channelMsg.fromuid = @(_OwnerID);
    channelMsg.fromnickname = [NSString stringWithFormat:@"User %d", _OwnerID];
    
    int tap = 0;
    if ([_giftDic objectForKey:@(index).stringValue] == nil) {
        [_giftDic setObject:@(0) forKey:@(index).stringValue];
    }
    tap = [[_giftDic objectForKey:@(index).stringValue] intValue];
    tap ++;
    [_giftDic setObject:@(tap) forKey:@(index).stringValue];
    
    channelMsg.tapCount = tap;
    
    [EServiceEventUtil postNotification:Table_ChannelMessage withEvent:Event_RowInsert withData:channelMsg];
}



@end
