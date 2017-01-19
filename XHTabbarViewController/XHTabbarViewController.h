//
//  XHTabbarViewController.h
//
//  Created by GaoYong on 15/11/23.
//  Copyright (c) 2015年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHTabbar.h"

typedef void(^transitionBlock)(UIViewController *fromVC,UIViewController *toVC);

@interface XHTabbarViewController : UIViewController
{
    UIView *contentView;           //承载uiviewcontroller的容器
    NSArray *curViewControllsers;  //所有的子viewcontroler
}

@property (nonatomic,strong) XHTabbar *tabbar;

@property(nonatomic,weak) UIViewController *selectedViewController;

@property(nonatomic) NSUInteger selectedIndex;

@property(nonatomic,copy) transitionBlock tAnimationBlcok;  //切换tab动画block

- (id) initWithViewController:(NSArray *) viewControllers;

-(void) tAnimationBlockCompliated:(UIViewController *) fromController toController:(UIViewController *) toController;

- (void)setViewControllers:(NSArray *) newViewControllers;

- (NSArray *) getCurViewControllers;

@end
