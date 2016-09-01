//
//  CaibdeAnimation.h
//  GWLZCDM
//
//  Created by cAibDe on 16/8/24.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CaibdeAnimation : NSObject<UIViewControllerAnimatedTransitioning>
/**
 *  图片的Rect
 */
@property (nonatomic, assign) CGRect imageRect;
/**
 *  图片
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  判断是否PUSH的标识
 */
@property (nonatomic, assign) BOOL isPush;

@property (nonatomic, assign) CGRect desRect;

@end
