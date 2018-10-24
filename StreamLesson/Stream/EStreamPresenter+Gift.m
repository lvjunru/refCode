//
//  EStreamPresenter+Gift.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamPresenter+Gift.h"
#import "MSWeakTimer.h"
#import "GiftChannelMessage.h"
#import "EStreamGiftBanner.h"
#import "IStreamView.h"
#import "CDDContext.h"

@implementation EStreamPresenter (Gift)

- (void)prepareGiftQueue
{
    self.giftQueue = @[].mutableCopy;
    
    self.giftReceiveTimer = [MSWeakTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onGiftQueueTimeout) userInfo:nil repeats:true dispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    [Notif removeObserver:self name:Notif_GiftBanner_ConsumedMsgs object:nil];
    [Notif addObserver:self selector:@selector(detectGiftBannerHide:) name:Notif_GiftBanner_ConsumedMsgs object:nil];
}

- (void)destroyGiftQueue
{
    [self.giftReceiveTimer invalidate];
    self.giftReceiveTimer = nil;
}


- (void)onReceiveGiftMsg:(ChannelMessage*)gift
{
    AssertMainThread
    
    [self.giftQueue addObject:gift];
}

#pragma mark- gift timer logic
- (void)onGiftQueueTimeout
{
    if ([NSThread isMainThread] == false) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self onGiftQueueTimeout];
        });
        return;
    }
    
    if (self.giftQueue.count == 0) {
        return;
    }
    
    id tobeRemoved = nil;
    //1. check banner A's next msg
    EStreamGiftBanner* bannerA = C(self.context.view, IStreamView, getBottomBanner);
    EStreamGiftBanner* bannerB = C(self.context.view, IStreamView, getTopBanner);
    
    if (bannerA.nextGiftMsg != nil) {
        //
    }
    else
    {
        //find nextMsg for A
        for (int i = 0; i < self.giftQueue.count; i ++) {
            GiftChannelMessage* msg = self.giftQueue[i];
            
            BOOL shouldBlockQueue = false;
            //msg sender does not exist in both banners
            if (msg.fromuid.longLongValue != bannerA.currentGiftMsg.fromuid.longLongValue &&
                msg.fromuid.longLongValue != bannerB.currentGiftMsg.fromuid.longLongValue) {
                shouldBlockQueue = true;
            }
            
            if (shouldBlockQueue) {
                break;
            }
            else
            {
                if (msg.fromuid.longLongValue == bannerA.currentGiftMsg.fromuid.longLongValue && [bannerA isHiding] == false) {
                    bannerA.nextGiftMsg = msg;
                    tobeRemoved = msg;
                    break;
                }
            }
        }
    }
    
    if (tobeRemoved != nil) {
        [self.giftQueue removeObject:tobeRemoved];
        tobeRemoved = nil;
    }
    
    //2. check banner B's next msg
    if (bannerB.nextGiftMsg != nil) {
        //
    }
    else
    {
        //find nextMsg for B
        for (int i = 0; i < self.giftQueue.count; i ++) {
            GiftChannelMessage* msg = self.giftQueue[i];
            
            BOOL shouldBlockQueue = false;
            //msg sender does not exist in both banners
            if (msg.fromuid.longLongValue != bannerA.currentGiftMsg.fromuid.longLongValue &&
                msg.fromuid.longLongValue != bannerB.currentGiftMsg.fromuid.longLongValue) {
                shouldBlockQueue = true;
            }
            
            if (shouldBlockQueue) {
                break;
            }
            else
            {
                if (msg.fromuid.longLongValue == bannerB.currentGiftMsg.fromuid.longLongValue && [bannerB isHiding] == false) {
                    bannerB.nextGiftMsg = msg;
                    tobeRemoved = msg;
                    break;
                }
            }
        }
    }
    
    if (tobeRemoved != nil) {
        [self.giftQueue removeObject:tobeRemoved];
        tobeRemoved = nil;
    }
    
    
    //3. check free space for new banner
    BOOL hasFreeSpace = C(self.context.view, IStreamView, hasFreeSpaceToPlayNormalGift);
    if (hasFreeSpace) {
        for (int i = 0; i < self.giftQueue.count; i ++) {
            GiftChannelMessage* msg = self.giftQueue[i];
            if (msg.fromuid.longLongValue != bannerA.currentGiftMsg.fromuid.longLongValue &&
                msg.fromuid.longLongValue != bannerB.currentGiftMsg.fromuid.longLongValue) { //msg sender does not exist in both banners
                //show banner
                C(self.context.view, IStreamView, playGiftAnimation:msg);
                tobeRemoved = msg;
                break;
            }
        }
    }
    
    if (tobeRemoved != nil) {
        [self.giftQueue removeObject:tobeRemoved];
        tobeRemoved = nil;
    }
}


#pragma mark- detect event
- (void)detectGiftBannerHide:(NSNotification*)notif
{
    NSArray* consumedMsgs = notif.object;
    if (consumedMsgs) {
        [self.giftQueue removeObjectsInArray:consumedMsgs];
    }
}

@end
