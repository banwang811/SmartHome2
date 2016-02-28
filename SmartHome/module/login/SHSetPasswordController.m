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


- (IBAction)finishClick:(UIButton *)sender{
    if (self.isRegister) {
        [self registerAccount];
    }else{
        [self resetPassword];
    }
}

- (void)registerAccount{
    NSDictionary *paras = @{@"phone":[SHAccountManager shareManager].account,
                            @"password":self.passwordTextField.text,
                            @"nickname":[SHAccountManager shareManager].nickname};
    [[SHHTTPManager shareManager] requestRegisterWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            [SHAccountManager shareManager].userId = [dict objectForKey:@"id"];
            [SHAccountManager shareManager].name = [dict objectForKey:@"name"];
            [SHAccountManager shareManager].email = [dict objectForKey:@"email"];
            [SHAccountManager shareManager].phone = [dict objectForKey:@"phone"];
            [SHAccountManager shareManager].role = [dict objectForKey:@"role"];
            [SHAccountManager shareManager].created_at = [dict objectForKey:@"created_at"];
            [SHAccountManager shareManager].updated_at = [dict objectForKey:@"updated_at"];
            [SHAccountManager shareManager].password = self.passwordTextField.text;
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败");
    }];
}

- (void)resetPassword{
    NSDictionary *paras = @{@"phone":[SHAccountManager shareManager].account,
                            @"password":self.passwordTextField.text};
    [[SHHTTPManager shareManager] requestSetpasswordWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            [SHAccountManager shareManager].userId = [dict objectForKey:@"id"];
            [SHAccountManager shareManager].name = [dict objectForKey:@"name"];
            [SHAccountManager shareManager].email = [dict objectForKey:@"email"];
            [SHAccountManager shareManager].phone = [dict objectForKey:@"phone"];
            [SHAccountManager shareManager].role = [dict objectForKey:@"role"];
            [SHAccountManager shareManager].created_at = [dict objectForKey:@"created_at"];
            [SHAccountManager shareManager].updated_at = [dict objectForKey:@"updated_at"];
            [SHAccountManager shareManager].password = self.passwordTextField.text;
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败");
    }];
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
