//
//  SHMineController.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHMineController.h"
#import "SHMineCell.h"
#import "SHSetingController.h"
#import "SHAboutController.h"
#import "SHDeviceController.h"

@interface SHMineController ()

@property (nonatomic, strong) NSArray           *headImages;

@property (nonatomic, strong) NSArray           *nameTitles;

@end

@implementation SHMineController

- (instancetype)init{
    if (self = [super init]) {
        self.headImages = [NSArray arrayWithObjects:@"default",@"device",@"control",@"about", nil];
        self.nameTitles = [NSArray arrayWithObjects:@"用户名",@"设备列表",@"监控",@"关于", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    [self setSetingBarItem];
}

- (void)setSetingBarItem{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [button setImage:[UIImage imageNamed:@"seting"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"seting_select"] forState:UIControlStateSelected];

    [button addTarget:self action:@selector(setingClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setingClick{
    SHSetingController *controller = [[SHSetingController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 85;
    }else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [self tableView:tableView headCellForRowAtIndexPath:indexPath];
    }else{
        cell = [self tableView:tableView normalCellForRowAtIndexPath:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView headCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHCellType_head"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHMineCell" owner:self options:0] lastObject];
    }
    cell.headImage.image = [UIImage imageNamed:[self.headImages objectAtIndex:[self getIndexWithIndexPath:indexPath]]];
    cell.userName.text = [self.nameTitles objectAtIndex:[self getIndexWithIndexPath:indexPath]];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView normalCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHCellType_normal"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHMineCell" owner:self options:0] firstObject];
    }
    cell.iconImage.image = [UIImage imageNamed:[self.headImages objectAtIndex:[self getIndexWithIndexPath:indexPath]]];
    cell.nameLabel.text = [self.nameTitles objectAtIndex:[self getIndexWithIndexPath:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        SHDeviceController *controller = [[SHDeviceController alloc] init];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.section == 3) {
        SHAboutController *controller = [[SHAboutController alloc] init];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
        
    }
}

- (NSInteger)getIndexWithIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
