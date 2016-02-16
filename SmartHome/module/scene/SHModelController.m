//
//  ViewController.m
//  Select
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHModelController.h"
#import "SHNormalCell.h"
#import "SHMenuCell.h"
#import "SHLightCell.h"
#import "SHAirconditionerCell.h"

#define menuNumber  10

@interface SHModelController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *menuTableView;

@property (nonatomic, strong) UITableView               *goodsTableView;

@property (nonatomic, strong) NSIndexPath               *selectIndxPath1;

@property (nonatomic, strong) NSIndexPath               *selectIndxPath2;

@property (nonatomic, assign) CGFloat                   width1;

@property (nonatomic, strong) UIButton                  *startButton;

@end

@implementation SHModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[AppManager shareManager] smallScreen]) {
        self.width1 = 60;
    }else{
        self.width1 = 80;
    }
    [self setleftBarItem];
    [self.view addSubview:self.menuTableView];
    [self.view addSubview:self.goodsTableView];
    [self.view addSubview:self.startButton];
    self.selectIndxPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
}


- (UIButton *)startButton{
    if (_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.frame = CGRectMake(28, SCREEN_HEIGHT - 40 - 20, SCREEN_WIDTH - 28 * 2, 40);
        _startButton.layer.cornerRadius = 5;
        [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startButton setBackgroundColor:[UIColor themeCoclor]];
        [_startButton setTitle:@"执行场景" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startScene) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}

- (UITableView *)menuTableView{
    if (_menuTableView == nil) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _width1, SCREEN_HEIGHT - 80) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.showsVerticalScrollIndicator = NO;
        _menuTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    return _menuTableView;
}

- (UITableView *)goodsTableView{
    if (_goodsTableView == nil) {
        _goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(_width1, 64,SCREEN_WIDTH - _width1, SCREEN_HEIGHT -64 - 80) style:UITableViewStylePlain];
        _goodsTableView.delegate = self;
        _goodsTableView.dataSource = self;
        _goodsTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.menuTableView) {
        return 1;
    }
    return menuNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.menuTableView) {
        return menuNumber;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 4 == 3 && tableView == self.goodsTableView) {
        return 130;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.menuTableView) {
        static NSString *cellid = @"menuTableViewIdentifier";
        SHMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (cell == nil) {
            cell = [[SHMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        if (indexPath == self.selectIndxPath1) {
            cell.backgroundColor = [UIColor whiteColor];
        }else{
            cell.backgroundColor = RGB(220, 230, 233, 1);
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellid2 = @"goodsTableViewIdentifier";
        SHBaseDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
        if (cell == nil) {
            if (indexPath.row%4 ==0 ) {
                cell = [[SHNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
            }else if (indexPath.row%4 == 1){
                cell = [[SHLightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
            }else if (indexPath.row%4 == 2){
                cell = [[SHLightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
            }else{
                cell = [[SHAirconditionerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
            }
        }
        if (indexPath == self.selectIndxPath2) {
            cell.backgroundColor = [UIColor yellowColor];
        }
        else{
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (tableView == self.menuTableView) {
        self.selectIndxPath1 = indexPath;
        cell.backgroundColor = [UIColor redColor];
        NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        self.selectIndxPath2 = indexPath2;
        [_goodsTableView scrollToRowAtIndexPath:indexPath2 atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else{
        cell.backgroundColor = [UIColor yellowColor];
        self.selectIndxPath2 = indexPath;
        NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        self.selectIndxPath1 = indexPath2;
        [_menuTableView scrollToRowAtIndexPath:indexPath2 atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    [_goodsTableView reloadData];
    [_menuTableView reloadData];
}

- (void)startScene{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
