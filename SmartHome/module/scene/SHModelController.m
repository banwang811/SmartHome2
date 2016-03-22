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
#import "SHSelectDeviceController.h"

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

@property (nonatomic, strong) NSMutableDictionary       *selectDicts;

@end

@implementation SHModelController

- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray array];
        self.selectDicts = [NSMutableDictionary dictionary];
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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadDevice)
                                                 name:SHDidSelectDeviceNotification
                                               object:nil];
    [self getAllDevices];
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
        _startButton.frame = CGRectMake(28, gScreenheight - 40 - 20, gScreenwidth - 28 * 2, 40);
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
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _width1, gScreenheight - 80) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.showsVerticalScrollIndicator = NO;
        _menuTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    return _menuTableView;
}

- (UITableView *)goodsTableView{
    if (_goodsTableView == nil) {
        _goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(_width1, 64,gScreenwidth - _width1, gScreenheight -64 - 80) style:UITableViewStylePlain];
        _goodsTableView.delegate = self;
        _goodsTableView.dataSource = self;
        _goodsTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
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
    if (tableView == self.goodsTableView) {
        SHDeviceModel *model = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        if (model.type == NSDeviceType_Aircondition) {
            return 130;
        }
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
            }else if (model.type == NSDeviceType_Aircondition){
                cell = [[SHAirconditionerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }else{
                cell = [[SHNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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

- (void)reloadDevice{
    [self praseDevicesType];
}

- (void)addDevice{
    SHSelectDeviceController *controller = [[SHSelectDeviceController alloc] init];
    controller.selectedDicts = self.selectDicts;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)getAllDevices{
    [[SHHTTPManager shareManager] requestDeviceWithParas:nil success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:0
                                                               error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            NSArray *devices = [dict objectForKey:@"devices"];
            for (NSDictionary *info in devices) {
                SHDeviceModel *model = [[SHDeviceModel alloc] init];
                [model setValuesForKeysWithDictionary:info];
                model.deviceID = [info objectForKey:@"id"];
                [[CacheManager shareManager].devicesDicts setObject:model forKey:model.deviceID];
            }
        }
    } failure:nil];
}

- (void)reloadData{
    [SHProgress showProgress:@"加载中..." toView:self.view];
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
            NSString *deviceStr = [dict objectForKey:@"devices"];
            [self praseDevices:deviceStr];
        }
        [SHProgress hideProgress:self.view animated:YES];
    } failure:^(NSError *error) {
        [SHProgress hideProgress:self.view animated:YES];
    }];
}

- (void)praseDevices:(NSString *)string{
    [self.selectDicts removeAllObjects];
    NSArray *array = [string componentsSeparatedByString:@";"];
    for (NSString *str in array) {
        NSArray *info = [str componentsSeparatedByString:@"="];
        if ([info count] == 2) {
            NSString  *deviceID = [info objectAtIndex:0];
            SHDeviceModel *model = [[CacheManager shareManager].devicesDicts objectForKey:deviceID];
            SHDeviceModel *deviceModel = nil;
            if (model) {
                deviceModel = [model copy];
            }else{
                deviceModel = [[SHDeviceModel alloc] init];
                deviceModel.deviceID = deviceID;
            }
            deviceModel.status = (NSDeviceStatusType)[[info objectAtIndex:1] integerValue];
            [self.selectDicts setObject:deviceModel forKey:deviceModel.deviceID];
        }
    }
    [self praseDevicesType];
}

- (void)praseDevicesType{
    [self.dataArray removeAllObjects];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSString *deviceID in [self.selectDicts allKeys]) {
        SHDeviceModel *deviceModel = [self.selectDicts objectForKey:deviceID];
        NSMutableArray *devices = [dict objectForKey:[NSNumber numberWithInteger:deviceModel.type]];
        if (devices) {
            [devices addObject:deviceModel];
        }else{
            devices = [NSMutableArray array];
            [devices addObject:deviceModel];
            [dict setObject:devices forKey:[NSNumber numberWithInteger:deviceModel.type]];
        }
    }
    for (NSNumber *number in [dict allKeys]) {
        NSArray *arr = [dict objectForKey:number];
        [self.dataArray addObject:arr];
    }
    [_menuTableView reloadData];
    [_goodsTableView reloadData];
}

- (void)startScene{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
