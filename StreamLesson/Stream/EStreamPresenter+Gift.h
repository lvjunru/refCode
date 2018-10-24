//
//  EStreamPresenter+Gift.h
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamPresenter.h"
#import "ChannelMessage.h"

@interface EStreamPresenter (Gift)

- (void)prepareGiftQueue;
- (void)destroyGiftQueue;

- (void)onReceiveGiftMsg:(ChannelMessage*)gift;

@end
