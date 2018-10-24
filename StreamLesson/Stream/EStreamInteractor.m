//
//  EStreamInteractor.m
//  PIXY
//
//  Created by gao feng on 16/4/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamInteractor.h"
#import "IStreamPresenter.h"

@implementation EStreamInteractor

- (void)gotoHomeController {
    
    C(self.context.presenter, IStreamPresenter, stopTest);
    
    [self.baseController dismissViewControllerAnimated:true completion:nil];
}



@end
