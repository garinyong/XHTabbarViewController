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
    self.tabbar = [[DemoTabbar alloc] initWithBar:tabbarHeight barItemData:tabbarItmeList selectBtnClickBlock:^(NSInteger selectIndex) {
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
