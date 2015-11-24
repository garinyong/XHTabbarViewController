//
//  ViewController3.m
//  XHTabbarViewControllerDemo
//
//  Created by GaoYong on 15/11/24.
//  Copyright © 2015年 GaoYong. All rights reserved.
//

#import "ViewController3.h"
#import "ViewController4.h"
#import "AppDelegate.h"
#import "XHTabbarViewController.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(0, 0, 50, 50);
    [pushBtn setTitle:@"click" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    pushBtn.center = self.view.center;
    [self.view addSubview:pushBtn];
}

-(void) viewWillAppear:(BOOL)animated
{
    //显示tabbar
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    XHTabbarViewController *tabbarVC = (XHTabbarViewController *)delegate.window.rootViewController;
    
    if ([tabbarVC isKindOfClass:[XHTabbarViewController class]])
    {
        tabbarVC.tabbar.hidden = NO;
    }
}

-(void) pushBtnClick
{
    //推出隐藏tabbar
    ViewController4 *vc = [ViewController4 new];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    XHTabbarViewController *tabbarVC = (XHTabbarViewController *)delegate.window.rootViewController;
    
    if ([tabbarVC isKindOfClass:[XHTabbarViewController class]])
    {
        tabbarVC.tabbar.hidden = YES;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
