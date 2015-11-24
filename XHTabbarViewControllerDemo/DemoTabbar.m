//
//  DemoTabbar.m
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import "DemoTabbar.h"
#import "XHTabbarItem.h"

@implementation DemoTabbar

#pragma mark -- override super class

-(void) createUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.alpha = 0.98;
    
    if (barItemDataList.count < 1)
    {
        return;
    }
    
    CGFloat spanWidth = self.bounds.size.width / barItemDataList.count;
    
    for (int i = 0; i < barItemDataList.count; i++)
    {
        XHTabbarItem *itemData = barItemDataList[i];
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.frame = CGRectMake(spanWidth  * i, 0.5, spanWidth, self.bounds.size.height - 0.5);
        itemBtn.backgroundColor = [UIColor clearColor];
        itemBtn.tag = i;
        [itemBtn setImage:[UIImage imageNamed:itemData.normalImageUrl] forState:UIControlStateNormal];
        [itemBtn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemBtn];
        [curItemBtns addObject:itemBtn];
    }
    
    UIView *splitLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0.5)];
    splitLine.backgroundColor = RGB(235, 235, 235);
    [self addSubview:splitLine];
}

@end
