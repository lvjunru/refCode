//
//  EServiceEventUtil.h
//  PIXY
//
//  Created by gao feng on 16/5/14.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EServiceEventUtil : NSObject

+ (void)postNotification:(NSString*)tableName withEvent:(NSString*)rowEvent withData:(id)data;

@end
