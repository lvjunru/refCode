//
//  EServiceEventUtil.m
//  PIXY
//
//  Created by gao feng on 16/5/14.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EServiceEventUtil.h"
#import "EDaoEventUtil.h"

@implementation EServiceEventUtil

+ (void)postNotification:(NSString*)tableName withEvent:(NSString*)rowEvent withData:(id)data
{
    [EDaoEventUtil postNotification:tableName withEvent:rowEvent withData:data];
}

@end
