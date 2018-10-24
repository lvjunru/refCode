//
//  LikeChannelMessage.h
//  PIXY
//
//  Created by gaofeng on 16/5/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

/***
 点赞
 ***/

#import "ChannelMessage.h"

typedef enum : NSUInteger {
    LikeChannelMessageColorBlue = 0,
    LikeChannelMessageColorPink = 1,
    LikeChannelMessageColorGreen = 2,
    LikeChannelMessageColorOrange = 3,
    LikeChannelMessageColorPurple = 4,
    LikeChannelMessageColorYellow = 5,
    LikeChannelMessageColorCount = 6,
} LikeChannelMessageColorType;

@interface LikeChannelMessage : ChannelMessage

@property (nonatomic, strong) NSNumber *colorId;
@property (nonatomic, assign) BOOL shouldShowInChats;

+ (LikeChannelMessageColorType)getRandomHeartColor;
+ (UIImage*)getHeartImageByType:(LikeChannelMessageColorType)type;

@end
