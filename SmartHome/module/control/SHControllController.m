//
//  ViewController.m
//  CircleDemo
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHControllController.h"
#import "BWButton.h"
#import "SHControllView.h"
#import "SHContentView.h"

#define gScreenheight [UIScreen mainScreen].bounds.size.height

#define gScreenwidth [UIScreen mainScreen].bounds.size.width

@interface SHControllController ()

@property (nonatomic, assign) CGFloat                   buttonRadius;

@property (nonatomic, strong) SHControllView            *controllView;

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
    self.navigationItem.title = @"控制面板";
    [self.view addSubview:self.selectView];
}

- (SHContentView *)selectView{
    if (_selectView == nil) {
        _selectView = [[SHContentView alloc] initWithFrame:CGRectMake(0, gScreenheight - 49 - gScreenwidth/2 - self.buttonRadius, gScreenwidth,gScreenwidth)];
    }
    return _selectView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
