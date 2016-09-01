//
//  CaibdeNavController.h
//  GWLZCDM
//
//  Created by cAibDe on 16/8/24.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaibdeNavController : UINavigationController

/**
 *  push 方法
 *
 *  @param viewController 目标控制器
 *  @param imageView      所要移动的ImageView
 *  @param desRect        目标位置矩形
 */

- (void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView *)imageView desRect:(CGRect)desRect;

/**
 *  push 不带有动画的形式
 *
 *  @param viewController 目标控制器
 *  @param isAnimation    是否带有动画
 */
- (void)pushViewController:(UIViewController *)viewController isAnimation:(BOOL)isAnimation;

- (UIViewController *)popViewControllerWithAnimated:(BOOL)animated isAnimation:(BOOL)isAnimation;

@end
