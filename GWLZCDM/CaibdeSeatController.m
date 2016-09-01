//
//  CaibdeSeatController.m
//  GWLZCDM
//
//  Created by cAibDe on 16/8/25.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "CaibdeSeatController.h"

#import "MJExtension.h"

@interface CaibdeSeatController ()

@end

@implementation CaibdeSeatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选座";
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



@end
