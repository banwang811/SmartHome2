//
//  SHSelectDeviceController.m
//  SmartHome
//
//  Created by banwang on 16/3/8.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSelectDeviceController.h"
#import "SHDeviceCell.h"

NSString  *const SHDidSelectDeviceNotification = @"SHDidSelectDeviceNotification";

@interface SHSelectDeviceController ()

@property (nonatomic, strong) NSMutableArray                    *dataArray;

@property (nonatomic, strong) UIBarButtonItem                   *rightItem;

@end

@implementation SHSelectDeviceController

- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray array];
        self.selectedDicts = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择设备";
    [self.view addSubview:self.tableView];
    [self setleftBarItem];
    self.navigationItem.rightBarButtonItem = self.rightItem;
    [self reloadData];
}

- (UIBarButtonItem *)rightItem{
    if (_rightItem == nil) {
        _rightItem = [[UIBarButtonItem alloc] initWithTitle:@"完成"
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(completed)];
        _rightItem.tintColor = [UIColor whiteColor];
    }
    return _rightItem;
}

- (void)completed{
    [[NSNotificationCenter defaultCenter] postNotificationName:SHDidSelectDeviceNotification
                                                        object:nil
                                                      userInfo:self.selectedDicts];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHDeviceModel *model = [self.dataArray objectAtIndex:indexPath.row];
    SHDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHDeviceCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHDeviceCell" owner:self options:0] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    cell.selectButton.hidden = NO;
    cell.selectButton.selected = [self hasSelected:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SHDeviceModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if ([self hasSelected:model]) {
        [self.selectedDicts removeObjectForKey:model.deviceID];
    }else{
        [self.selectedDicts setObject:model forKey:model.deviceID];
    }
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationNone];
}

- (BOOL)hasSelected:(SHDeviceModel *)model{
    if ([self.selectedDicts objectForKey:model.deviceID]) {
        return YES;
    }
    return NO;
}

- (void)reloadData{
    [SHProgress showProgress:@"加载中..." toView:self.view];
    [[SHHTTPManager shareManager] requestDeviceWithParas:nil success:^(id responseObject) {
        [self.dataArray removeAllObjects];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:0
                                                               error:nil];
        
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            NSArray *devices = [dict objectForKey:@"devices"];
            for (NSDictionary *info in devices) {
                SHDeviceModel *model = [[SHDeviceModel alloc] init];
                [model setValuesForKeysWithDictionary:info];
                model.deviceID = [info objectForKey:@"id"];
                [self.dataArray addObject:model];
            }
            [self.tableView reloadData];
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
        [SHProgress hideProgress:self.view animated:YES];
    } failure:^(NSError *error) {
        [SHProgress hideProgress:self.view animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
