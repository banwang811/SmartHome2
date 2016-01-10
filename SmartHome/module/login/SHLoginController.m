//
//  SHLoginController.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginController.h"
#import "SHRegisterController.h"
#import "SHForgetPasswordController.h"

@interface SHLoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SHLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.accountTextField) {
        [SHAccountManager shareManager].account = textField.text;
    }else{
        [SHAccountManager shareManager].password = textField.text;
    }
}

- (IBAction)longin:(UIButton *)sender {
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameter=@{};
    [manager POST:serverAddress parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (IBAction)forgetPassword:(UIButton *)sender {
    SHForgetPasswordController *controller = [[SHForgetPasswordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)showPassword:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
}

- (IBAction)registerClick:(UIButton *)sender {
    SHRegisterController *controller = [[SHRegisterController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
