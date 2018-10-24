//
//  EHomeController.m
//  PIXY
//
//  Created by gao feng on 16/4/26.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EHomeController.h"
#import "EHomeAdapter.h"
#import "IHomeView.h"
#import "IHomeInteractor.h"

@interface EHomeController () <EAdapterDelegate>
@property (nonatomic, strong) EHomeAdapter*                 adapter;
@end

@implementation EHomeController

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [self configMVP:@"Home"];
    
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.adapter = [EHomeAdapter new];
    _adapter.adapterDelegate = self;
    
    C(self.view, IHomeView, buildHomeView:_adapter);

}


#pragma mark - EAdapterDelegate
- (void)didSelectCellData:(id)cellData
{
    C(self.context.interactor, IHomeInteractor, gotoLiveStream);
}


@end
