//
//  SHDeviceController.m
//  SmartHome
//
//  Created by banwang on 16/3/8.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceController.h"
#import "SHDeviceCell.h"

@interface SHDeviceController ()

@property (nonatomic, strong) NSMutableArray                    *dataArray;

@end

@implementation SHDeviceController

- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设备列表";
    [self.view addSubview:self.tableView];
    [self setleftBarItem];
    [self reloadData];
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
    cell.model = model;
    return cell;
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
