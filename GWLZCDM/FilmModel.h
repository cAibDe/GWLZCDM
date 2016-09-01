//
//  FilmModel.h
//  GWLZCDM
//
//  Created by cAibDe on 16/8/24.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmModel : NSObject
/**
 *  图片名字
 */
@property (nonatomic, copy) NSString *image;
/**
 *  电影名字
 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *cover;

+ (NSArray *)filmArray;

@end
