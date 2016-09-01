//
//  FilmViewController.h
//  GWLZCDM
//
//  Created by cAibDe on 16/8/25.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmViewController : UIViewController

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, strong) UIImageView *filmImageView;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;


@end
