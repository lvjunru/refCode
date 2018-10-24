//
//  EStreamShareView.m
//  StreamLesson
//
//  Created by gao feng on 16/7/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamShareView.h"
#import "EStreamShareHolder.h"

@interface EStreamShareView ()
@property (nonatomic, strong) EStreamShareHolder*                 shareHolder;

@end

@implementation EStreamShareView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = false;
    }
    return self;
}

- (void)initCustomView {
    
    int height = 65;
    
    self.shareHolder = [EStreamShareHolder new];
    _shareHolder.frame = CGRectMake(0, self.bounds.size.height - height, SCREEN_WIDTH, height);
    [self addSubview:_shareHolder];
    _shareHolder.hidden = YES;
    [_shareHolder buildShare];
    
    [self addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)showGiftShareView:(BOOL)show {
    if (show) {
        [_shareHolder showWithAnimated:true];
    }
    else
    {
        [_shareHolder hideWithAnimated:true];
    }
    
    self.userInteractionEnabled = show;
}


- (void)hide
{
    [self showGiftShareView:false];
}

@end
