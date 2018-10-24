//
//  EStreamGiftBanner.h
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftChannelMessage.h"

typedef void (^GiftBannerAnimationBlock)(int line);

@interface EStreamGiftBanner : UIView

@property (nonatomic, strong) GiftChannelMessage *currentGiftMsg;
@property (nonatomic, strong) GiftChannelMessage *nextGiftMsg;

- (void)initWithGiftMsg:(GiftChannelMessage*)msg showLine:(int)line;

- (void)showWithAnimationFinishBlock:(GiftBannerAnimationBlock)block;
- (void)playNumberAnimationWithCount:(int)count;
- (void)hide;

- (void)btnAvatarClicked;

- (BOOL)isHiding;

+ (CGFloat)bannerHeight;
+ (CGFloat)bannerWidth;

@end
