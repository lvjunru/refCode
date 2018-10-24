//
//  EDaoNotificationUtil.h
//  EIM
//
//  Created by gao feng on 16/4/28.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDaoEventUtil : NSObject

+ (void)postNotification:(NSString*)tableName withEvent:(NSString*)rowEvent withData:(id)data;

@end
