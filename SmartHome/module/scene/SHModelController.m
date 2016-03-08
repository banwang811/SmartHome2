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

@property (nonatomic, strong) NSMutableArray            *dataArray;

@property (nonatomic, strong) UIBarButtonItem           *rightItem;

@end

@implementation SHModelController

- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

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
    self.navigationItem.rightBarButtonItem = self.rightItem;
    self.selectIndxPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
    [self reloadData];
}

- (UIBarButtonItem *)rightItem{
    if (_rightItem == nil) {
        _rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加设备"
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(addDevice)];
        _rightItem.tintColor = [UIColor whiteColor];
    }
    return _rightItem;
}

- (UIButton *)startButton{
    if (_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.frame = CGRectMake(28, SCREEN_HEIGHT - 40 - 20, SCREEN_WIDTH - 28 * 2, 40);
        _startButton.layer.cornerRadius = 5;
        [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startButton setBackgroundColor:[UIColor redColor]];
        [_startButton setTitle:@"保存场景" forState:UIControlStateNormal];
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
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.menuTableView) {
        return [self.dataArray count];
    }
    return [[self.dataArray objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHDeviceModel *model = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (model.type == NSDeviceType_Aircondition && tableView == self.goodsTableView) {
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
        SHDeviceModel *model = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        NSString *cellId = [SHDeviceModel getDeviceIdentifier:model.type];
        SHBaseDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            if (model.type == NSDeviceType_Light) {
                cell = [[SHNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }else if (model.type == NSDeviceType_TV){
                cell = [[SHLightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }else{
                cell = [[SHAirconditionerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
        }
        if (indexPath == self.selectIndxPath2) {
            cell.backgroundColor = [UIColor yellowColor];
        }
        else{
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
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

/*
 {
 "created_at" = "2016-01-17 23:52:40";
 "default_icon" = 0;
 devices = "4=101;3=100;";
 error = 0;
 group = "\U534e\U90e1\U6d4b\U8bd5\U7ec4";
 id = 38;
 "is_default" = 0;
 name = "\U6d4b\U8bd5";
 "updated_at" = "2016-03-07 06:07:25";
 "user_id" = 1;
 }
 */

- (void)addDevice{

}

- (void)reloadData{
    NSDictionary *params = @{@"sceneID":self.model.sceneID};
    [[SHHTTPManager shareManager] requestSceneWithParas:params success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"error"] integerValue] == 0) {
            [self.dataArray removeAllObjects];
            SHSceneModel *model = [[SHSceneModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            model.sceneID = [dict objectForKey:@"id"];
            model.type = (SHSceneType)[[dict objectForKey:@"default_icon"] intValue];
            for (int i = 1; i < 4 ; i ++) {
                NSMutableArray *array = [NSMutableArray array];
                for (int j = 0; j < 5; j++) {
                    SHDeviceModel *model = [[SHDeviceModel alloc] init];
                    model.type = (NSDeviceType)i;
                    [array addObject:model];
                }
                [self.dataArray addObject:array];
            }
            [_menuTableView reloadData];
            [_goodsTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)startScene{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
