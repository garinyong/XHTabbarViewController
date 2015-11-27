//
//  XHTabbar.h
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tabbarItemButtonSelect)(NSInteger selectIndex);

@interface XHTabbar : UIView
{
    NSMutableArray *curItemBtns;
    NSArray *barItemDataList;
    tabbarItemButtonSelect selectBtnClick;
}

-(instancetype) initWithBar:(CGFloat) barHeight barItemData:(NSArray *) barItemData selectBtnClickBlock:(tabbarItemButtonSelect) selectBtnClickBlock;

-(void) itemClick:(UIButton *) btn;

@end
