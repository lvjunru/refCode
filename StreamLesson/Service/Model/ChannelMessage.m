//
//  ChannelMessage.m
//  StreamLesson
//
//  Created by gao feng on 16/7/23.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import "ChannelMessage.h"
#import "TYAttributedLabel.h"
#import "UIFont+App.h"

@implementation ChannelMessage


- (TYTextContainer*)createRichTextContainer {
    TYTextContainer *textContainer = [[TYTextContainer alloc]init];
    textContainer.lineBreakMode = kCTLineBreakByWordWrapping;
    textContainer.characterSpacing = 0;
    return textContainer;
}

- (UIFont*)getContentFont {
    return [UIFont fontOfSystemFontWithMediumSize:15];
}

- (UIFont*)getNameFont {
    return [UIFont fontOfSystemFontWithSemiBoldSize:15];
}


@end
