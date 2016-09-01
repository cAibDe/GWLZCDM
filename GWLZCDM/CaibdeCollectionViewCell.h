//
//  CaibdeCollectionViewCell.h
//  GWLZCDM
//
//  Created by cAibDe on 16/8/25.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"
@interface CaibdeCollectionViewCell : UICollectionViewCell
/**
 *  电影的封面图
 */
@property (nonatomic, strong) UIImageView *filmImageView;
/**
 *  电影名字Label
 */
@property (nonatomic, strong) UILabel *filmLabel;
/**
 *  电影数据实例
 */
@property (nonatomic, strong) FilmModel *model;

- (void)updateData:(FilmModel *)model withIndexPath:(NSIndexPath *)indexPath;

@end
