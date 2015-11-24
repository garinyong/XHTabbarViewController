//
//  XHTabbar.m
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import "XHTabbar.h"
#import "XHTabbarItem.h"

@interface XHTabbar ()

@end

@implementation XHTabbar

-(instancetype) initWithBar:(CGFloat) barHeight barItemData:(NSArray *) barItemData selectBtnClickBlock:(tabbarItemButtonSelect) selectBtnClickBlock
{
    CGRect frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - barHeight, [UIScreen mainScreen].bounds.size.width , barHeight);
    if (self = [super initWithFrame:frame])
    {
        curItemBtns = [NSMutableArray array];
        barItemDataList = barItemData;
        selectBtnClick = selectBtnClickBlock;
        
        [self createUI];
    }
    
    return self;
}

/**
 * 子类重写
 */
-(void) createUI
{
    
}

-(void) itemClick:(UIButton *) btn
{
    if (selectBtnClick)
    {
        [self changeUI:btn.tag];
        selectBtnClick(btn.tag);
    }
}

-(void) changeUI:(NSInteger) newSelectIndex
{
    for (int i = 0; i < curItemBtns.count; i++)
    {
        UIButton *temBtn = [curItemBtns objectAtIndex:i];
        XHTabbarItem *itemData = barItemDataList[i];
        
        if (i == newSelectIndex)
        {
            [temBtn setImage:[UIImage imageNamed:itemData.selectedImageUrl] forState:UIControlStateNormal];
        }
        else
        {
            [temBtn setImage:[UIImage imageNamed:itemData.normalImageUrl] forState:UIControlStateNormal];
        }
    }
}

@end
