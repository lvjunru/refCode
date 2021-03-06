//
//  UIFont+App.m
//  Coco
//
//  Created by gaofeng on 13/6/14.
//  Copyright (c) 2014 music4kid Inc. All rights reserved.
//

#import "UIFont+App.h"

@implementation UIFont (App)

+ (UIFont*)appFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)fontOfHelveticaNeueLightWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont*)boldAppFontOfSize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)fontOfHelveticaNeueRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue Regular" size:size];
}


+ (UIFont *)fontOfHelveticaNeueThinWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue Thin" size:size];
}


+ (UIFont *)fontOfHelveticaNeueMediumWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue Medium" size:size];
}

+ (UIFont *)fontOfRobotoRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto Regular" size:size];
}

+ (UIFont *)fontOfSystemFontWithMediumSize:(CGFloat)size
{
    UIFont *font = nil;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]*10000 >= __IPHONE_8_2) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    }
    else
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)fontOfSystemFontWithSemiBoldSize:(CGFloat)size {
    UIFont *font = nil;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]*10000 >= __IPHONE_8_2) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
    }
    else
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)fontOfSystemFontWithRegularSize:(CGFloat)size
{
    UIFont *font = nil;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]*10000 >= __IPHONE_8_2) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
    }
    else
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)fontOfSystemFontWithHeavySize:(CGFloat)size
{
    UIFont *font = nil;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]*10000 >= __IPHONE_8_2) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightHeavy];
    }
    else
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

@end
