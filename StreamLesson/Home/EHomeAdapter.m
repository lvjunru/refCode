//
//  EHomeAdapter.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "EHomeAdapter.h"
#import "EHomeTableViewCell.h"
#import "ChannelProfile.h"

@implementation EHomeAdapter

- (CGFloat)getCellHeight:(NSInteger)row
{
    CGFloat height = SCREEN_WIDTH + 54;
    ChannelProfile *model = [self.getAdapterArray objectAtIndex:row];
    if (model.title.length > 0) {
        CGSize titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        if (titleSize.width > SCREEN_WIDTH - 35) {
            // 两行
            height +=67;
        }
        else
        {
            height +=50;
        }
    }
    else
    {
        height += 8;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self getCellHeight:indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.getAdapterArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChannelProfile* liveModel = self.getAdapterArray[indexPath.row];
    
    UITableViewCell *cell = nil;
    
    CCSuppressPerformSelectorLeakWarning (
                                          cell = [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"tableView:cellForEChannelProfile:"]) withObject:tableView withObject:liveModel];
                                          );
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForEChannelProfile:(id)model {
    NSString *cellIdentifier = NSStringFromSelector(_cmd);
    EHomeTableViewCell *cell = (EHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[EHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ChannelProfile* liveModel = model;
    [cell setCellContent:liveModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    id model = self.getAdapterArray[indexPath.row];
    if (self.adapterDelegate && [self.adapterDelegate respondsToSelector:@selector(didSelectCellData:)]) {
        [self.adapterDelegate didSelectCellData:model];
    }
}

@end
