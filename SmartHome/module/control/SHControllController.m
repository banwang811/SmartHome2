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

#define gScreenheight [UIScreen mainScreen].bounds.size.height

#define gScreenwidth [UIScreen mainScreen].bounds.size.width

@interface SHControllController ()

@property (nonatomic, assign) CGFloat                   buttonRadius;

@property (nonatomic, strong) SHDeviceControllView      *deviceControllView;

@property (nonatomic, strong) SHContentView             *selectView;

@end

@implementation SHControllController

- (instancetype)init{
    if (self = [super init]) {
        self.buttonRadius = 55;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(90, 200, 230, 1);
    self.navigationItem.title = @"控制面板";
    [self.view addSubview:self.selectView];
    [self.view addSubview:self.deviceControllView];
    [self.deviceControllView layoutContentView:BWDeviceType_window];
}

- (SHContentView *)selectView{
    if (_selectView == nil) {
        _selectView = [[SHContentView alloc] initWithFrame:CGRectMake(0, gScreenheight - 49 - gScreenwidth/2 - self.buttonRadius, gScreenwidth,gScreenwidth)];
    }
    return _selectView;
}

- (SHDeviceControllView *)deviceControllView{
    if (_deviceControllView == nil) {
        _deviceControllView = [[SHDeviceControllView alloc] initWithFrame:CGRectMake(0, 64, gScreenwidth , gScreenheight   - 64 - 49 - gScreenwidth/2 - self.buttonRadius) viewType:BWDeviceType_light];
    }
    return _deviceControllView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
