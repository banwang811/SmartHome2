//
//  SHForgetPasswordController.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHForgetPasswordController.h"
#import "SHSetPasswordController.h"

@interface SHForgetPasswordController ()

@property (weak, nonatomic) IBOutlet UITextField        *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton           *verificationButton;
@property (weak, nonatomic) IBOutlet UITextField        *verification;

@end

@implementation SHForgetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"找回密码";
    [self setleftBarItem];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)getVerificationCode:(UIButton *)sender {
    
}

- (IBAction)nextStep:(UIButton *)sender {
    SHSetPasswordController *controller = [[SHSetPasswordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
