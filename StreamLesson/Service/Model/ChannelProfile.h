//
//  ChannelProfile.h
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelProfile : NSObject

@property (nonatomic, strong) NSNumber *ownerUid;
@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *ownerAvatar;
@property (nonatomic, strong) NSString *ownerLocation;
@property (nonatomic, strong) NSNumber *ownerLevel;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *userCount;
@property (nonatomic, strong) NSNumber *isOwnerSigned;
@property (nonatomic, strong) NSNumber *isOwnerCered;

@property (nonatomic, strong) NSString *liveStatus;
@property (nonatomic, assign) BOOL isLivePause;

@property (nonatomic, strong, readonly) NSNumber *starBalance;
@property (nonatomic, strong) NSNumber *userTotalCount;//累计访问人数
@property (nonatomic, strong) NSNumber *starTotalCount;//累计star数量
@property (nonatomic, strong) NSNumber *likeTotalCount;//累计点赞人数


@end
