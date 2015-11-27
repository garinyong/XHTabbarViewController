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

}
@end

@implementation XHTabbarViewController

-(id) initWithViewController:(NSArray *) viewControllers
{
    if (self = [super init])
    {
        curViewControllsers = viewControllers;
        
        if (curViewControllsers.count > 0)
        {
            self.selectedIndex = 0;
            self.selectedViewController = [curViewControllsers firstObject];
        }
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
    
    self.selectedIndex = 0;
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabbar];
    [self.selectedViewController didMoveToParentViewController:self];
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
    if (newSelectIndex == _selectedIndex) {
        return;
    }
    
    UIViewController *fromController = self.selectedViewController;
    UIViewController *toController = [curViewControllsers objectAtIndex:newSelectIndex];
    
    //    toController.view.frame = fromController.view.bounds;
    [self addChildViewController:toController];
    [fromController willMoveToParentViewController:nil];
    
    if (_transitionDuraiton > 0 && self.tAnimationBlcok)
    {
        [self.view insertSubview:toController.view belowSubview:fromController.view];
        
        [UIView animateWithDuration:_transitionDuraiton animations:^{
            
            self.tAnimationBlcok(fromController,toController);
            
        }completion:^(BOOL finished)
         {
             [toController didMoveToParentViewController:self];
             [fromController removeFromParentViewController];
             [fromController.view removeFromSuperview];
             
             self.selectedViewController = toController;
             _selectedIndex = newSelectIndex;
         }];
    }
    else
    {
        [toController didMoveToParentViewController:self];
        [self.view insertSubview:toController.view belowSubview:self.tabbar];
        [fromController removeFromParentViewController];
        [fromController.view removeFromSuperview];
        
        self.selectedViewController = toController;
        _selectedIndex = newSelectIndex;
    }
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
        self.selectedViewController = [curViewControllsers firstObject];
    }
    
    self.selectedIndex = 0;
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabbar];
    [self.selectedViewController didMoveToParentViewController:self];
}


@end
