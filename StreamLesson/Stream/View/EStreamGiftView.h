//
//  EStreamGiftView.h
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GiftChannelMessage;
@class EStreamGiftBanner;

@interface EStreamGiftView : UIView

- (void)initCustomView;

- (void)showGeneralGiftAnimation:(GiftChannelMessage*)giftMsg;
- (EStreamGiftBanner *)getTopBanner;
- (EStreamGiftBanner *)getBottomBanner;

- (BOOL)hasFreeSpace;


@end
