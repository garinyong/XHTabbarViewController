//
//  XHTabbarItem.m
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import "XHTabbarItem.h"

@implementation XHTabbarItem

-(instancetype) initWithSelectedImageUrl:(NSString *) selectedImageUrl normalImageUrl:(NSString *) normalImageUrl
{
    if (self = [super init])
    {
        _selectedImageUrl = selectedImageUrl;
        _normalImageUrl = normalImageUrl;
    }
    
    return self;
}

@end
