//
//  EDaoNotificationUtil.m
//  EIM
//
//  Created by gao feng on 16/4/28.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EDaoEventUtil.h"

@implementation EDaoEventUtil

+ (void)postNotification:(NSString*)tableName withEvent:(NSString*)rowEvent withData:(id)data
{
    NSMutableDictionary *info = [NSMutableDictionary new];
    info[@"data"] = data;
    info[@"table"] = tableName;
    info[@"event"] = rowEvent;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:tableName object:nil userInfo:info];
    });
}

@end
