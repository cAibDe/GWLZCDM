//
//  ViewController.m
//  GWLZCDM
//
//  Created by cAibDe on 16/8/24.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "ViewController.h"
#import "FilmModel.h"
#import "CaibdeCollectionViewCell.h"
#import "FilmViewController.h"
#import "CaibdeNavController.h"
#define kPadding 10
#define kItemOfLine 3

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**
 *  电影数据的数组
 */
@property (nonatomic, strong) NSArray *filmArray;
/**
 *  布局
 */
@property (nonatomic, strong) UICollectionViewFlowLayout *filmCollectionLayout;
/**
 *  CollectionView
 */
@property (nonatomic, strong) UICollectionView *filmCollectionView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"电影列表";

    [self setUpUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UI
- (void)setUpUI{
    [self creatCollectionView];
}
- (void)creatCollectionView{
    //FlowLayOut
    CGFloat width = (self.view.bounds.size.width - kPadding*(kItemOfLine +1))/kItemOfLine;
    self.filmCollectionLayout = [[UICollectionViewFlowLayout alloc]init];
    self.filmCollectionLayout.itemSize = CGSizeMake(width, width*1.5);
    self.filmCollectionLayout.minimumLineSpacing = 2*kPadding;
    self.filmCollectionLayout.minimumInteritemSpacing  = kPadding;
    //CollectionView
    self.filmCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) collectionViewLayout:self.filmCollectionLayout];
    self.filmCollectionView.delegate = self;
    self.filmCollectionView.dataSource = self;
    [self.filmCollectionView registerClass:[CaibdeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CaibdeCollectionViewCell class])];
    self.filmCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.filmCollectionView];
}
#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.filmArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CaibdeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CaibdeCollectionViewCell class]) forIndexPath:indexPath];
    FilmModel *model = self.filmArray[indexPath.row];
    [cell updateData:model withIndexPath:indexPath];
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FilmViewController *filmVC = [[FilmViewController alloc]init];
    CaibdeCollectionViewCell *cell = (CaibdeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    FilmModel *model = self.filmArray[indexPath.row];
    filmVC.name = model.name;
    filmVC.cover = model.cover;
    filmVC.image = model.image;
    filmVC.width = cell.filmImageView.bounds.size.width;
    filmVC.height = cell.filmImageView.bounds.size.height;
    
    [((CaibdeNavController *)self.navigationController) pushViewController:filmVC withImageView:cell.filmImageView desRect:CGRectMake(20, 150, cell.filmImageView.bounds.size.width, cell.filmImageView.bounds.size.height)];
}
#pragma mark - Lazy Load
- (NSArray *)filmArray{
    if (!_filmArray) {
        _filmArray = [FilmModel filmArray];
    }
    return _filmArray;
}

@end
