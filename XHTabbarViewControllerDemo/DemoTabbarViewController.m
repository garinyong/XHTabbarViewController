//
//  DemoTabbarViewController.m
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import "DemoTabbarViewController.h"
#import "XHTabbarItem.h"
#import "DemoTabbar.h"

@interface DemoTabbarViewController ()

@end

@implementation DemoTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak XHTabbarViewController *weakSelf = self;
    //自定义切换动画，发挥想象力吧
    self.tAnimationBlcok = ^(UIViewController *fromVC,UIViewController *toVC)
    {
        toVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toVC.view.alpha = 0;
        [UIView animateWithDuration:0.35 animations:^{
            
            fromVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
            toVC.view.transform = CGAffineTransformMakeScale(1, 1);
            fromVC.view.alpha = 0;
            toVC.view.alpha = 1;
            
        }completion:^(BOOL finished)
         {
             //动画完成，需要掉用此方法，完成后续
             [weakSelf tAnimationBlockCompliated:fromVC toController:toVC];
             fromVC.view.transform = CGAffineTransformMakeScale(1, 1);
         }];

    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- override super class

-(void) makeTabbar
{
    NSArray *tabbarItmeList = @[
                                [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected1" normalImageUrl:@"itemNormal1"],
                                [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected2" normalImageUrl:@"itemNormal2"],
                                [[XHTabbarItem alloc] initWithSelectedImageUrl:@"itemSelected3" normalImageUrl:@"itemNormal3"]
                                ];
    __weak XHTabbarViewController *weekSelf = self;
    self.tabbar = [[DemoTabbar alloc] initWithBar:49 barItemData:tabbarItmeList beforeSelectBtnClickBlock:^BOOL(UIButton *newSelectBtn) {
        //是否可以选某个tab，可以做在此做一些事情
        return YES;
    } selectBtnClickBlock:^(NSInteger selectIndex) {
        
        weekSelf.selectedIndex = selectIndex;
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
