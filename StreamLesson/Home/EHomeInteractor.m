//
//  EHomeInteractor.m
//  PIXY
//
//  Created by gao feng on 16/4/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EHomeInteractor.h"
#import "EStreamController.h"

@implementation EHomeInteractor

- (void)gotoLiveStream {
    EStreamController* ctrl = [EStreamController new];
    [self.baseController presentViewController:ctrl animated:true completion:^{
        
    }];
}



@end
