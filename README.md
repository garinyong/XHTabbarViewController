# XHTabbarViewController
继承自UIViewController自定义TabbarViewController，支持tabbar高度自定义，使用方法较简单，在子类实现指定方法，解决系统tabbar隐藏困难，可定制性差的问题。

兼容性：
Minimum iOS Target : iOS 6

使用方法：
Installation with CocoaPods

pod 'XHTabbarViewController', '~> 1.0.2'

代码调用：
DemoTabbar : XHTabbar
重写XHTabbar
-(void) createUI 方法

DemoTabbarViewController : XHTabbarViewController
重写XHTabbarViewController
-(void) makeTabbar 方法

    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ViewController1 new]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[ViewController2 new]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[ViewController3 new]];
    DemoTabbarViewController *tabVC = [[DemoTabbarViewController alloc] initWithViewController:@[nav1,nav2,nav3]];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    

tabbar显示，隐藏
XHTabbarViewController 的tabbar.hidden = NO; //or YES

自定义tab切换动画：在DemoTabbarViewController中加入以下block

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
    ｝
