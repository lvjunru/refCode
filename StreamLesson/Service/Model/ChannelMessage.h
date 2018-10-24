//
//  ChannelMessage.h
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  kChannelMsgType_Text       1 //普通文本
#define  kChannelMsgType_Like       2 //点赞
#define  kChannelMsgType_DANMAKU    3 //弹幕
#define  kChannelMsgType_Gift       4 //礼物


@class TYTextContainer;

@interface ChannelMessage : NSObject

@property (nonatomic, retain) NSString *channelId;
@property (nonatomic, retain) NSNumber *fromuid;
@property (nonatomic, retain) NSString *fromnickname;
@property (nonatomic, retain) NSString *tonickname;
@property (nonatomic, retain) NSString *fromavatar;
@property (nonatomic, retain) NSString *msgUUID;
@property (nonatomic, retain) NSNumber *msgId;
@property (nonatomic, retain) NSNumber *rowid;
@property (nonatomic, retain) NSNumber *touid;
@property (nonatomic, retain) NSNumber *msgtype;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSNumber* msgsrvtime;

- (UIFont*)getNameFont;
- (UIFont*)getContentFont;
- (TYTextContainer*)createRichTextContainer;
- (TYTextContainer*)getRichTextContainer;

@end
