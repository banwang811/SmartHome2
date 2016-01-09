//
//  SHSetPasswordController.m
//  SmartHome
//
//  Created by banwang on 16/1/9.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSetPasswordController.h"

@interface SHSetPasswordController ()

@property (weak, nonatomic) IBOutlet UITextField *ensureTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SHSetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setleftBarItem];
    if (self.isRegister) {
        self.navigationItem.title = @"设置密码";
    }else{
        self.navigationItem.title = @"设置新密码";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)finishClick:(UIButton *)sender {
    
}

- (IBAction)showPassword:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
}

- (IBAction)showEnsure:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.ensureTextField.secureTextEntry = !self.ensureTextField.secureTextEntry;
}

@end
