# GWLZCDM
这是我在别人哪里学到的一个类似于格瓦拉电影的转场动画，我在里面改了一下，用一个导航控制器去执行不同的Push效果
#PUSH
这是带有动画效果的一个Push
```objc
- (void)pushViewController:(UIViewController *)viewController isAnimation:(BOOL)isAnimation{
    self.isAnimation = isAnimation;
    self.isPush = YES;
    [super pushViewController:viewController animated:YES];
}
```
当self.isAnimation = YES;Push就会带有那种动画的效果，反之就不会带有动画效果；



#POP
这个就是返回的时候不带有动画效果的方法
```objc
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.isPush = NO;
    return [super popViewControllerAnimated:animated];
}
```
这就是返回的时候带有效果的Pop
```objc
- (UIViewController *)popViewControllerWithAnimated:(BOOL)animated isAnimation:(BOOL)isAnimation{
    self.isPush = NO;
    self.isAnimation = isAnimation;
    return [super popViewControllerAnimated:animated];
}
```
#讨论区
最近有个朋友给我提了一个小问题，说是第二个界面滑动的时候，电影海报会有个BUG，这里我做了改进。
我们可以再CaibdeAnimation这个类中的push代码模块中- (void)cAibDePushAnimation{}这个方法里面的一个代码注释掉就可以解决了，这个代码就是[contentView bringSubviewToFront:imageView];
