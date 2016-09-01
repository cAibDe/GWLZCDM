//
//  CaibdeNavController.m
//  GWLZCDM
//
//  Created by cAibDe on 16/8/24.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "CaibdeNavController.h"
#import "CaibdeAnimation.h"
@interface CaibdeNavController ()<UINavigationControllerDelegate>
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect desRect;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, assign) BOOL isAnimation;
@end

@implementation CaibdeNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView *)imageView desRect:(CGRect)desRect{
    self.delegate = self;
    self.origionRect = [imageView convertRect:imageView.frame toView:self.view];
    ;
    self.desRect = desRect;
    self.image = imageView.image;
    self.isPush = YES;
    self.isAnimation = YES;
    [super pushViewController:viewController animated:YES];
}
- (void)pushViewController:(UIViewController *)viewController isAnimation:(BOOL)isAnimation{
    self.isAnimation = isAnimation;
    self.isPush = YES;
    [super pushViewController:viewController animated:YES];
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.isPush = NO;
    return [super popViewControllerAnimated:animated];
}
- (UIViewController *)popViewControllerWithAnimated:(BOOL)animated isAnimation:(BOOL)isAnimation{
    self.isPush = NO;
    self.isAnimation = isAnimation;
    return [super popViewControllerAnimated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (self.isAnimation) {
        CaibdeAnimation *animation = [[CaibdeAnimation alloc]init];
        animation.imageRect = self.origionRect;
        animation.image = self.image;
        animation.isPush = self.isPush;
        animation.desRect = self.desRect;
        if (!self.isPush) {
            self.delegate = nil;
        }
        return animation;
    }else{
        return nil;
    }

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
