//
//  EHomeView.m
//  PIXY
//
//  Created by gao feng on 16/4/26.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EHomeView.h"
#import "EAdapter.h"
#import "ChannelProfile.h"

@interface EHomeView ()
@property (nonatomic, strong) UITableView*                 tableView;
@end

@implementation EHomeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)buildHomeView:(EAdapter*)adapter {
    
    CGRect frame = self.bounds;
    frame.origin.y = 20;
    frame.size.height -= (20+44);
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.clipsToBounds = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    
    _tableView.delegate = adapter;
    _tableView.dataSource = adapter;
    
    
    
    //prepare test data
    NSMutableArray* dataArray = @[].mutableCopy;
    for (int i = 0; i < 10; i ++) {
        ChannelProfile* channel = [ChannelProfile new];
        channel.ownerName = @"Somebody";
        channel.title = @"好好学习，天天向上";
        channel.ownerLocation = @"天气很热";
        channel.userCount = @(10000);
        
        [dataArray addObject:channel];
    }
    
    [adapter setAdapterArray:dataArray];
    [_tableView reloadData];
}



@end
