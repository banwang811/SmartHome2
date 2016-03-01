//
//  SHAddRoomController.m
//  SmartHome
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHAddRoomController.h"
#import "SHRoomCell.h"
#import "IQKeyboardManager.h"
#import "SHPickerView.h"

#define pickerViewHight 216

@interface SHAddRoomController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) SHPickerView          *pickerView;

@property (nonatomic, strong) NSArray               *pickerArray;

@property (nonatomic, strong) SHRoomModel           *roomModel;

@end

@implementation SHAddRoomController

- (instancetype)init{
    if (self = [super init]) {
        self.pickerArray = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"卫生间",@"书房",@"育儿室",@"衣帽间",@"餐食间",@"娱乐室", nil];
        self.roomModel = [[SHRoomModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加房间";
    [self setleftBarItem];
    [self.view addSubview:self.tableView];
    [self setPickerView];
}

- (void)setPickerView{
    self.pickerView = [[SHPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, pickerViewHight)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    __weak SHAddRoomController * weakSelf = self;
    self.pickerView.sureButtonClickBlock = ^{
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.pickerView.frame = CGRectMake(0, weakSelf.view.frame.size.height, weakSelf.view.frame.size.width, pickerViewHight);
        }];
    };
    [self.view addSubview:self.pickerView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
}

#pragma mark - pickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerArray count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerArray objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //改变cell
    SHRoomCell *cell = (SHRoomCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    cell.roomType.text = [self.pickerArray objectAtIndex:row];
    self.roomModel.roomType = (NSRoomType)row;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }else if (indexPath.row == 1){
        return 40;
    }else{
        return 80;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHRoomCell *cell = nil;
    if (indexPath.row == 0) {
        cell = [self tableView:tableView infocellForRowAtIndexPath:indexPath];
    }else if (indexPath.row == 1){
        cell = [self tableView:tableView levelcellForRowAtIndexPath:indexPath];
    }else{
        cell = [self tableView:tableView savecellForRowAtIndexPath:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (SHRoomCell *)tableView:(UITableView *)tableView infocellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHRoomCellType_info"];
    if (cell == nil) {
        cell = [SHRoomCell creatCell:SHRoomCellType_info];
    }
    return cell;
}

- (SHRoomCell *)tableView:(UITableView *)tableView levelcellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHRoomCellType_level"];
    if (cell == nil) {
        cell = [SHRoomCell creatCell:SHRoomCellType_level];
    }
    return cell;
}

- (SHRoomCell *)tableView:(UITableView *)tableView savecellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHRoomCellType_save"];
    if (cell == nil) {
        cell = [SHRoomCell creatCell:SHRoomCellType_save];
    }
    cell.saveRoom = ^(SHRoomModel *model){
        [self addRoom:self.roomModel];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        __weak SHAddRoomController * weakSelf = self;
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.pickerView.frame = CGRectMake(0, weakSelf.view.frame.size.height - pickerViewHight, weakSelf.view.frame.size.width, pickerViewHight);
        }];
    }
}

- (void)addRoom:(SHRoomModel *)model{
    SHRoomCell *cell = (SHRoomCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    self.roomModel.name = cell.roomName.text;
    if (!checkString(self.roomModel.name)) {
        showAlert(@"请输入房间名");
    }else if (!checkString(self.roomModel.floor)){
        showAlert(@"请输入楼层数");
    }
    self.roomModel.floor = cell.levelcount.text;
    NSDictionary *paras = @{@"name":self.roomModel.name,
                            @"floor":self.roomModel.floor,
                            @"type":[NSNumber numberWithInt:self.roomModel.roomType]};
    [[SHHTTPManager shareManager] requestAddRoomDevicesWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
//            [self.navigationController popViewControllerAnimated:YES];
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败！");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
