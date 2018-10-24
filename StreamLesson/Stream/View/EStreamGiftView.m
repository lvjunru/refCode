//
//  EStreamGiftView.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamGiftView.h"
#import "EStreamGiftBanner.h"
#import "GiftChannelMessage.h"

@interface EStreamGiftView ()
@property (nonatomic, strong) EStreamGiftBanner *topBanner;
@property (nonatomic, strong) EStreamGiftBanner *bottomBanner;

@end

@implementation EStreamGiftView

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor randomColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initCustomView {
	
}


#pragma mark - normal gifts
- (void)showGeneralGiftAnimation:(GiftChannelMessage*)giftMsg {
    
    if (giftMsg.tapCount == 0) {
        return;
    }
    
    if ([self hasFreeSpace] == false) {
        return;
    }
    
    int bannerWidth = [EStreamGiftBanner bannerWidth];
    int bannerHeight = [EStreamGiftBanner bannerHeight];
    
    int bottomMargin = 80 + 300;
    int originY = SCREEN_HEIGHT - bottomMargin - bannerHeight;
    int padding = 20;
    int line = 2;
    
    if (_bottomBanner == nil) {
        //
    }
    else if(_topBanner == nil)
    {
        originY -= (padding + bannerHeight);
        line = 1;
    }
    
    EStreamGiftBanner *giftBanner = [[EStreamGiftBanner alloc] initWithFrame:CGRectMake(0, originY, bannerWidth, bannerHeight)];
    [self addSubview:giftBanner];
    [giftBanner initWithGiftMsg:giftMsg showLine:line];
    
    if (line == 1) {
        self.topBanner = giftBanner;
    }
    else if (line == 2)
    {
        self.bottomBanner = giftBanner;
    }
    
    [giftBanner showWithAnimationFinishBlock:^(int line) {
        
        if (line == 2) {
            self.bottomBanner = nil;
        }
        else if (line == 1)
        {
            self.topBanner = nil;
        }
        
    }];
    
}

- (EStreamGiftBanner *)getTopBanner
{
    return _topBanner;
}

- (EStreamGiftBanner *)getBottomBanner
{
    return _bottomBanner;
}

- (BOOL)hasFreeSpace
{
    return _topBanner == nil || _bottomBanner == nil;
}


@end
