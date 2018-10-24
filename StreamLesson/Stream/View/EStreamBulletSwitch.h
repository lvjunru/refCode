//
//  EStreamBulletSwitch.h
//  StreamLesson
//
//  Created by gao feng on 16/7/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EStreamBulletSwitchDelegate <NSObject>

- (void)didClickBulletSwitch;
- (void)switchOnBullet;

@end


@interface EStreamBulletSwitch : UIButton

@property (nonatomic, weak) id<EStreamBulletSwitchDelegate>                 switchDelegate;

- (void)buildViews;

@end
