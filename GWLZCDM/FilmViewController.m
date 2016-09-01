//
//  FilmViewController.m
//  GWLZCDM
//
//  Created by cAibDe on 16/8/25.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "FilmViewController.h"
#import "CaibdeNavController.h"
#import "CaibdeSeatController.h"
@interface FilmViewController ()
/**
 *  顶部视图
 */
@property (nonatomic, strong) UIImageView *topView;
/**
 *  电影名
 */
@property (nonatomic, strong) UILabel *nameLabel;
/**
 *  导航栏隐藏的时候返回按钮
 */
@property (nonatomic, strong) UIButton* closeButton;

@property (nonatomic, strong) UIScrollView *filmScrollView;
/**
 *  在线选座
 */
@property (nonatomic, strong) UIButton *selectedSeatButton;

@end

@implementation FilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.nameLabel];
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.selectedSeatButton];
    [self.view addSubview:self.filmImageView];
    
    self.filmImageView.image = [UIImage imageNamed:self.image];
    self.topView.image = [UIImage imageNamed:self.cover];
    self.nameLabel.text = self.name;
    self.title = self.name;
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = YES;
    }
}
- (void)creatScrollView{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Lazy Load
- (UIImageView *)topView{
    if (!_topView) {
        _topView = [[UIImageView alloc]init];
        _topView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 220);
        _topView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _topView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 170, 250, 40)];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _nameLabel;
}
- (UIButton *)closeButton
{
    if (!_closeButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        button.frame = CGRectMake(10, 30, 30, 30);
        
        _closeButton = button;
    }
    return _closeButton;
}
- (UIButton *)selectedSeatButton{
    
    if (!_selectedSeatButton) {
        _selectedSeatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedSeatButton.frame = CGRectMake(200,400, 100, 30);
        [_selectedSeatButton setTitle:@"在线选座" forState:UIControlStateNormal];
        [_selectedSeatButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        _selectedSeatButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [_selectedSeatButton addTarget:self action:@selector(pushToSelectedSeat) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedSeatButton;
}
- (UIImageView *)filmImageView{
    if (!_filmImageView) {
        _filmImageView = [[UIImageView alloc]init];
        _filmImageView.frame = CGRectMake(20, 150, _width, _height);
    }
    return _filmImageView;
}
- (void)pushToSelectedSeat{
    CaibdeSeatController *seatVC = [[CaibdeSeatController alloc]init];
    [((CaibdeNavController *)self.navigationController) pushViewController:seatVC isAnimation:NO];
}
-(void)close{
//    [((CaibdeNavController*)self.navigationController) popViewControllerAnimated:YES];
    [((CaibdeNavController*)self.navigationController) popViewControllerWithAnimated:YES isAnimation:YES];
}
@end
