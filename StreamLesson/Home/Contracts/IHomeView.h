//
//  IHomeView.h
//  PIXY
//
//  Created by gao feng on 16/4/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#ifndef IHomeView_h
#define IHomeView_h

@class EAdapter;

@protocol IHomeView <NSObject>

- (void)buildHomeView:(EAdapter*)adapter;

@end

#endif /* IHomeView_h */
