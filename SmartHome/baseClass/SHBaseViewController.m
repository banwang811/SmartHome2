//
//  SHBaseViewController.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHBaseViewController.h"

@interface SHBaseViewController ()

@end

@implementation SHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor backgroundColor];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)setleftBarItem{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
