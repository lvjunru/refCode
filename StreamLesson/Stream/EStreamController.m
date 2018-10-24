//
//  EStreamController.m
//  PIXY
//
//  Created by gao feng on 16/4/26.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamController.h"
#import "EStreamAdapter.h"
#import "IStreamView.h"
#import "EServiceEventUtil.h"
#import "ChannelMessage.h"
#import "GiftChannelMessage.h"
#import "LikeChannelMessage.h"
#import "IStreamPresenter.h"

@interface EStreamController ()
@property (nonatomic, strong) EStreamAdapter*                       adapter;
@end

@implementation EStreamController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [self configMVP:@"Stream"];
    
    [super viewDidLoad];
    
    self.adapter = [EStreamAdapter new];
    self.context.presenter.adapter = self.adapter;
    
    
    C(self.view, IStreamView, buildStreamView:_adapter);
    C(self.context.presenter, IStreamPresenter, startTest);
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:true animated:true];
    
    [Notif removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [Notif addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [Notif removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [Notif addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [Notif removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [Notif removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:false];
}


#pragma mark-    Keyboard Event
- (void)keyboardWillShow:(NSNotification *)notification {
    C(self.view, IStreamView, adjustTalkViewOnKeyboardShow:notification);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    C(self.view, IStreamView, adjustTalkViewOnKeyboardHide:notification);
}

@end
