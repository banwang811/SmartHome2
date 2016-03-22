//
//  ViewController.m
//  CircleDemo
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHControllController.h"
#import "BWButton.h"
#import "SHContentView.h"
#import "SHDeviceControllView.h"
#import "SHNoteView.h"
#import "SHAddDeviceController.h"
#import "SHAddRoomController.h"

@interface SHControllController ()

@property (nonatomic, assign) CGFloat                   buttonRadius;

@property (nonatomic, strong) SHDeviceControllView      *deviceControllView;

@property (nonatomic, strong) SHContentView             *selectView;

@property (nonatomic, strong) UIBarButtonItem           *rightButtonItem;

@property (nonatomic, strong) SHNoteView                *noteView;

@property (nonatomic, strong) NSMutableArray            *floorsArray;

@property (nonatomic, strong) NSMutableArray            *roomsArray;

@property (nonatomic, strong) NSMutableArray            *devicesArray;

@end

@implementation SHControllController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SHDidSelectNotifacation object:nil];
}

- (instancetype)init{
    if (self = [super init]) {
        self.floorsArray = [NSMutableArray array];
        self.roomsArray = [NSMutableArray array];
        self.devicesArray = [NSMutableArray array];
        self.buttonRadius = 55;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getAllDevices];
    self.view.backgroundColor = RGB(90, 200, 230, 1);
    self.navigationItem.title = @"控制面板";
    [self.view addSubview:self.selectView];
    [self.view addSubview:self.deviceControllView];
    [self.view addSubview:self.noteView];
    self.navigationItem.rightBarButtonItem = self.rightButtonItem;
    [self.deviceControllView layoutContentView:BWDeviceType_window];
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(pushController:) name:SHDidSelectNotifacation object:nil];
}

- (UIBarButtonItem *)rightButtonItem{
    if (_rightButtonItem == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 40, 40);
        [button setImage:[UIImage imageNamed:@"controll_bar_add"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    return _rightButtonItem;
}

- (void)addButtonClick:(UIButton *)button{
    self.noteView.hidden = !self.noteView.hidden;
}

- (void)pushController:(NSNotification *)notification{
    self.noteView.hidden = !self.noteView.hidden;
    NSString *type = [[notification userInfo] objectForKey:@"type"];
    if ([type isEqualToString:@"addRoom"]) {
        SHAddRoomController *controller = [[SHAddRoomController alloc] init];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        SHAddDeviceController *controller = [[SHAddDeviceController alloc] init];
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (SHNoteView *)noteView{
    if (_noteView == nil) {
        _noteView = [[SHNoteView alloc] initWithFrame:CGRectMake(gScreenwidth - 8 - 100, 64, 100, 93)];
        _noteView.hidden = YES;
    }
    return _noteView;
}

- (SHContentView *)selectView{
    if (_selectView == nil) {
        _selectView = [[SHContentView alloc] initWithFrame:CGRectMake(0, gScreenheight - 49 - gScreenwidth/2 - self.buttonRadius, gScreenwidth,gScreenwidth)];
    }
    return _selectView;
}

- (SHDeviceControllView *)deviceControllView{
    if (_deviceControllView == nil) {
        _deviceControllView = [[SHDeviceControllView alloc] initWithFrame:CGRectMake(0, 64, gScreenwidth , gScreenheight   - 64 - 49 - gScreenwidth/2 - self.buttonRadius)
                                                                 viewType:BWDeviceType_light];
    }
    return _deviceControllView;
}

- (void)getAllDevices{
    [[SHHTTPManager shareManager] requestControlWithParas:nil success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            NSArray *floors = [dict objectForKey:@"floors"];
            for (NSDictionary *info in floors) {
                NSArray *rooms = [dict objectForKey:@"rooms"];
                for (NSDictionary *roomInfo in rooms) {
                    SHRoomModel *roomModel = [[SHRoomModel alloc] init];
                    roomModel.name = [roomInfo objectForKey:@"name"];
                    roomModel.roomId = [roomInfo objectForKey:@"room_id"];
                    roomModel.roomType = (NSRoomType)[[roomInfo objectForKey:@"type"] integerValue];
                    NSArray *devices = [dict objectForKey:@"devices"];
                    for (NSDictionary *deviceInfo in devices) {
                        SHDeviceModel *deviceModel = [[SHDeviceModel alloc] init];
                        [deviceModel setValuesForKeysWithDictionary:deviceInfo];
                    }
                }
            }
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
