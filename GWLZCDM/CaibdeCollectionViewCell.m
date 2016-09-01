//
//  CaibdeCollectionViewCell.m
//  GWLZCDM
//
//  Created by cAibDe on 16/8/25.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "CaibdeCollectionViewCell.h"
@interface CaibdeCollectionViewCell()


@end

@implementation CaibdeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.filmImageView];
        [self addSubview:self.filmLabel];
    }
    return self;
}
-(void)updateData:(FilmModel *)model withIndexPath:(NSIndexPath *)indexPath{
    self.filmImageView.image = [UIImage imageNamed:model.image];
    self.filmLabel.text = model.name;
}

#pragma mark - Lazy Load
- (UILabel *)filmLabel{
    if (!_filmLabel) {
        _filmLabel = [[UILabel alloc]init];
        _filmLabel.frame = CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20);
        _filmLabel.textAlignment = NSTextAlignmentCenter;
        _filmLabel.font = [UIFont systemFontOfSize:15];
        _filmLabel.textColor = [UIColor blueColor];
        
    }
    return _filmLabel;
}
- (UIImageView *)filmImageView{
    if (!_filmImageView) {
        _filmImageView = [[UIImageView alloc]init];
        _filmImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-20);
    }
    return _filmImageView;
}
@end
