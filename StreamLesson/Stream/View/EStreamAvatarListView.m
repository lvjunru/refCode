//
//  EStreamAvatarListView.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EStreamAvatarListView.h"

@interface EStreamAvatarListView ()

@end

@implementation EStreamAvatarListView

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
	
    int marginX = 5;
    for (int i = 0; i < 20; i ++) {
        
        UIImageView* imgAvatar = [UIImageView new];
        imgAvatar.backgroundColor = [UIColor clearColor];
        imgAvatar.contentMode = UIViewContentModeScaleAspectFill;
        imgAvatar.clipsToBounds =true;
        imgAvatar.image = [UIImage imageNamed:@"avatarSmall"];
        imgAvatar.layer.cornerRadius = 18;
        imgAvatar.layer.masksToBounds = true;
        [self addSubview:imgAvatar];
        
        imgAvatar.frame = CGRectMake(marginX, 5, 36, 36);
        marginX += (5+36);
        
    }
    
}



@end
