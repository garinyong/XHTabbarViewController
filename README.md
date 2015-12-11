# XHTabbarViewController
继承自UIViewController自定义TabbarViewController，支持tabbar高度自定义，使用方法较简单，在子类实现指定方法，解决系统tabbar隐藏困难，可定制性差的问题。

Minimum iOS Target : iOS 6

使用方法：
DemoTabbar : XHTabbar
重写XHTabbar
-(void) createUI 方法

DemoTabbarViewController : XHTabbarViewController
重写XHTabbarViewController
-(void) makeTabbar 方法

调用：

    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ViewController1 new]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[ViewController2 new]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[ViewController3 new]];
    DemoTabbarViewController *tabVC = [[DemoTabbarViewController alloc] initWithViewController:@[nav1,nav2,nav3]];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    

tabbar显示，隐藏
XHTabbarViewController 的tabbar.hidden = NO; //or YES

自定义tab切换动画：在DemoTabbarViewController中加入以下block

    self.transitionDuraiton = 0.2;
    self.tAnimationBlcok = ^(UIViewController *fromVC,UIViewController *toVC)
    {
        fromVC.view.alpha = 0;
        toVC.view.alpha = 1;
    };
