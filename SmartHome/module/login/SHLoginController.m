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
    NSDictionary *paras = @{@"phone":[SHAccountManager shareManager].account,
                            @"password":self.passwordTextField.text};
    [[SHHTTPManager shareManager] requestLoginWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            [SHAccountManager shareManager].userId = [dict objectForKey:@"id"];
            [SHAccountManager shareManager].name = [dict objectForKey:@"name"];
            [SHAccountManager shareManager].email = [dict objectForKey:@"email"];
            [SHAccountManager shareManager].phone = [dict objectForKey:@"phone"];
            [SHAccountManager shareManager].role = [dict objectForKey:@"role"];
            [SHAccountManager shareManager].password = self.passwordTextField.text;
            [SHAccountManager shareManager].created_at = [dict objectForKey:@"created_at"];
            [SHAccountManager shareManager].updated_at = [dict objectForKey:@"updated_at"];
            appDelegate.window.rootViewController = appDelegate.tabbarContoller;
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败");
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
