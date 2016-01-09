//
//  XHTabbarViewController.m
//
//  Created by GaoYong on 15/11/23.
//  Copyright (c) 2015年 dangdang. All rights reserved.
//

#import "XHTabbarViewController.h"
#import "XHTabbarItem.h"

@interface XHTabbarViewController ()
{
    BOOL isAnimating;
}
@end

@implementation XHTabbarViewController

-(id) initWithViewController:(NSArray *) viewControllers
{
    if (self = [super init])
    {
        curViewControllsers = viewControllers;
        isAnimating = NO;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    contentView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    contentView.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:contentView];
    
    [self makeTabbar];
    [self.view addSubview:self.tabbar];
    
    _selectedIndex = 0;
    self.selectedViewController = [curViewControllsers objectAtIndex:_selectedIndex];
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabbar];
    [self.selectedViewController didMoveToParentViewController:self];
    [self.tabbar changeUI:0];
}

/**
 *  需要设置tabbar
 */
-(void) makeTabbar
{
    /*
     NSArray *tabbarItmeList = @[
     [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected1" normalImageUrl:@"itemNormal1"],
     [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected2" normalImageUrl:@"itemNormal2"],
     [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected3" normalImageUrl:@"itemNormal3"]
     ];
     __weak XHTabbarViewController *weekSelf = self;
     self.tabbar = [[XHTabbar alloc] initWithBar:tabbarHeight barItemData:tabbarItmeList selectBtnClickBlock:^(NSInteger selectIndex) {
     weekSelf.selectedIndex = selectIndex;
     }];
     */
}

//选中某个索引
-(void) setSelectedIndex:(NSUInteger) newSelectIndex
{
    if (isAnimating)
    {
        return;
    }
    
    @synchronized(self)
    {
        if (newSelectIndex == _selectedIndex)
        {
            return;
        }
        
        UIViewController *fromController = self.selectedViewController;
        UIViewController *toController = [curViewControllsers objectAtIndex:newSelectIndex];
        
        //    toController.view.frame = fromController.view.bounds;
        [self addChildViewController:toController];
        [fromController willMoveToParentViewController:nil];
        
        //有动画
        if (self.tAnimationBlcok)
        {
            isAnimating = YES;
            [self.view insertSubview:toController.view belowSubview:fromController.view];
            
            self.tAnimationBlcok(fromController,toController);
        }
        else
        {
            [toController didMoveToParentViewController:self];
            [self.view insertSubview:toController.view belowSubview:self.tabbar];
            [fromController removeFromParentViewController];
            [fromController.view removeFromSuperview];
        }
        
        self.selectedViewController = toController;
        _selectedIndex = newSelectIndex;
    }
}

/**
 *  如果有切换动画，须在动画完成的时候调用此方法完成后续
 *
 *  @param fromController
 *  @param toController
 */
-(void) tAnimationBlockCompliated:(UIViewController *) fromController toController:(UIViewController *) toController
{
    [toController didMoveToParentViewController:self];
    [fromController removeFromParentViewController];
    [fromController.view removeFromSuperview];
    
    isAnimating = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  设置viewcontonller
 *
 *  @param newViewControllers 新的viewcontrollers
 */
- (void)setViewControllers:(NSArray *) newViewControllers
{
    for (UIViewController *uv in curViewControllsers)
    {
        [uv removeFromParentViewController];
    }
    
    curViewControllsers = newViewControllers;
    
    if (curViewControllsers.count > 0)
    {
        self.selectedViewController = [curViewControllsers objectAtIndex:_selectedIndex];
    }
    
    self.selectedViewController = [curViewControllsers objectAtIndex:_selectedIndex];
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabbar];
    [self.selectedViewController didMoveToParentViewController:self];
    [self.tabbar changeUI:_selectedIndex];
}

- (NSArray *) getCurViewControllers
{
    return curViewControllsers;
}

@end
