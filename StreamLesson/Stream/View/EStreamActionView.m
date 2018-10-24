//
//  EStreamActionView.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamActionView.h"
#import "Masonry.h"
#import "CDDContext.h"
#import "IStreamPresenter.h"
#import "IStreamInteractor.h"
#import "IStreamView.h"

@interface EStreamActionView ()

@property (nonatomic, strong) UIButton *btnChat;
@property (nonatomic, strong) UIButton *btnShare;
@property (nonatomic, strong) UIButton *btnGift;
@property (nonatomic, strong) UIButton *btnClose;

@end

@implementation EStreamActionView

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
    
    int expandTouchArea = 4;
    
    //btnChat
    self.btnChat = [UIButton new];
    _btnChat.backgroundColor = [UIColor clearColor];
    [_btnChat addTarget:self action:@selector(btnChatClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"ic_chat"];
    [_btnChat setImage:btnImage forState:UIControlStateNormal];
    [_btnChat setImage:[UIImage imageNamed:@"ic_chat_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnChat];
    
    int padding = 6;
    int height = self.bounds.size.height;
    CGFloat chatButtonWith = self.bounds.size.width - ((37+expandTouchArea)*3+4*6);
    CGFloat chatIconSize = btnImage.size.height;
    [_btnChat makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.width.equalTo(btnImage.size.width);
        make.height.equalTo(btnImage.size.height);
        
    }];
    
    //btnClose
    int rightPadding = 6;
    self.btnClose = [UIButton new];
    [_btnClose addTarget:self action:@selector(btnCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
    _btnClose.backgroundColor = [UIColor clearColor];
    btnImage = [UIImage imageNamed:@"ic_close"];
    [_btnClose setImage:btnImage forState:UIControlStateNormal];
    [_btnClose setImage:[UIImage imageNamed:@"ic_close_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnClose];
    [_btnClose setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnClose makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self).offset(-rightPadding);
        make.centerY.equalTo(self);
        make.width.equalTo(btnImage.size.width + expandTouchArea);
        make.height.equalTo(height);
        
    }];
    
    //btnGift
    self.btnGift = [UIButton new];
    rightPadding = 10;
    _btnGift.backgroundColor = [UIColor clearColor];
    
    btnImage = [UIImage imageNamed:@"ic_gift"];
    [_btnGift setImage:[UIImage imageNamed:@"ic_gift_press"] forState:UIControlStateHighlighted];
    [_btnGift addTarget:self action:@selector(btnGiftClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_btnGift setImage:btnImage forState:UIControlStateNormal];
    [self addSubview:_btnGift];
    [_btnGift setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnGift makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(_btnClose.mas_leading).offset(-rightPadding+expandTouchArea);
        make.centerY.equalTo(self);
        make.width.equalTo(btnImage.size.width + expandTouchArea);
        make.height.equalTo(height);
        
    }];
    
    //btnShare
    self.btnShare = [UIButton new];
    [_btnShare addTarget:self action:@selector(btnShareClicked:) forControlEvents:UIControlEventTouchUpInside];
    _btnShare.backgroundColor = [UIColor clearColor];
    btnImage = [UIImage imageNamed:@"ic_share"];
    [_btnShare setImage:btnImage forState:UIControlStateNormal];
    [_btnShare setImage:[UIImage imageNamed:@"ic_share_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnShare];
    [_btnShare setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnShare makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(_btnGift.mas_leading).offset(-rightPadding+expandTouchArea);
        make.centerY.equalTo(self);
        make.width.equalTo(btnImage.size.width + expandTouchArea);
        make.height.equalTo(height);
        
    }];
}


- (void)btnCloseClicked:(id)sender
{
    C(self.context.interactor, IStreamInteractor, gotoHomeController);
}

- (void)btnGiftClicked:(id)sender
{
    C(self.context.view, IStreamView, showGiftSelectionView:true);
}

- (void)btnShareClicked:(id)sender
{
    C(self.context.view, IStreamView, showShareView:true);
}

- (void)btnChatClicked:(id)sender
{
    C(self.context.view, IStreamView, showInputView:true);
}

@end
