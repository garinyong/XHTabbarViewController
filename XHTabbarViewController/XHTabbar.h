//
//  XHTabbar.h
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tabbarItemButtonSelect)(NSInteger selectIndex);

typedef BOOL(^couldSelectTabItem)(UIButton *newSelectBtn);

@interface XHTabbar : UIView
{
    NSMutableArray *curItemBtns;
    NSArray *barItemDataList;
    tabbarItemButtonSelect selectBtnClick;
    couldSelectTabItem beforeSelectBtnClick;
}

-(instancetype) initWithBar:(CGFloat) barHeight barItemData:(NSArray *) barItemData beforeSelectBtnClickBlock:(couldSelectTabItem) beforeSelectBtnClickBlock selectBtnClickBlock:(tabbarItemButtonSelect) selectBtnClickBlock;

-(void) itemClick:(UIButton *) btn;

-(void) changeUI:(NSInteger) newSelectIndex;

-(void) selectNewTabItemWithIndex:(NSInteger) newSelectIndex;

@end
