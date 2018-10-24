//
//  IStreamView.h
//  PIXY
//
//  Created by gao feng on 16/4/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#ifndef IStreamView_h
#define IStreamView_h

@class EAdapter;
@class EStreamGiftBanner;
@class GiftChannelMessage;

@protocol IStreamView <NSObject>

- (void)buildStreamView:(EAdapter*)adapter;

- (EStreamGiftBanner *)getTopBanner;
- (EStreamGiftBanner *)getBottomBanner;
- (BOOL)hasFreeSpaceToPlayNormalGift;
- (void)playGiftAnimation:(GiftChannelMessage*)giftMsg;
- (void)fireHeartWithColorId:(NSNumber *)colorId;


- (void)showGiftSelectionView:(BOOL)show;
- (void)showShareView:(BOOL)show;
- (void)showInputView:(BOOL)show;

- (void)adjustTalkViewOnKeyboardHide:(NSNotification*)notification;
- (void)adjustTalkViewOnKeyboardShow:(NSNotification*)notification;

@end

#endif /* IStreamView_h */
