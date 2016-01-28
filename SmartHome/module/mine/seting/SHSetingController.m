//
//  SHSetingController.m
//  SmartHome
//
//  Created by banwang on 16/1/29.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSetingController.h"
#import "SHMineCell.h"

@interface SHSetingController ()

@property (nonatomic, strong) NSArray           *headImages;

@property (nonatomic, strong) NSArray           *nameTitles;

@property (nonatomic, strong) UIButton          *logout;

@end

@implementation SHSetingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.logout];
    self.tableView.scrollEnabled = NO;
    [self setleftBarItem];
}

- (UIButton *)logout{
    if (_logout == nil) {
        _logout = [UIButton buttonWithType:UIButtonTypeCustom];
        _logout.frame = CGRectMake(28, 250, SCREEN_WIDTH - 28 * 2, 40);
        _logout.layer.cornerRadius = 5;
        [_logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logout setBackgroundColor:[UIColor themeCoclor]];
        [_logout setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logout;
}

- (void)logoutClick{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (instancetype)init{
    if (self = [super init]) {
        self.headImages = [NSArray arrayWithObjects:@"account",@"password",@"update", nil];
        self.nameTitles = [NSArray arrayWithObjects:@"账号管理",@"修改密码",@"软件更新", nil];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHCellType_normal"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHMineCell" owner:self options:0] firstObject];
    }
    cell.iconImage.image = [UIImage imageNamed:[self.headImages objectAtIndex:[self getIndexWithIndexPath:indexPath]]];
    cell.nameLabel.text = [self.nameTitles objectAtIndex:[self getIndexWithIndexPath:indexPath]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)getIndexWithIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section;
}




@end
