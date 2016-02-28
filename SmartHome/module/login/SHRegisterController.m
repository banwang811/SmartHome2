//
//  SHRegisterController.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRegisterController.h"
#import "SHSetPasswordController.h"

@interface SHRegisterController ()

@property (weak, nonatomic) IBOutlet UITextField        *account;
@property (weak, nonatomic) IBOutlet UITextField        *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField        *verificationCode;
@property (weak, nonatomic) IBOutlet UIButton           *verificationButton;
@end

@implementation SHRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    [self setleftBarItem];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)registerClick:(UIButton *)sender {
    NSDictionary *paras = @{@"phone":self.phoneNumber.text,
                            @"code":self.verificationCode.text};
    [[SHHTTPManager shareManager] requestCheckSecuritycodeWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            //完成
            [SHAccountManager shareManager].nickname = self.account.text;
            [SHAccountManager shareManager].account = self.phoneNumber.text;
            [SHAccountManager shareManager].verificationCode = self.verificationCode.text;
            SHSetPasswordController *controller = [[SHSetPasswordController alloc] init];
            controller.isRegister = YES;
            [self.navigationController pushViewController:controller animated:YES];
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败");
    }];
}

- (IBAction)getVerificationCode:(UIButton *)sender {
    NSDictionary *paras = @{@"phone":self.phoneNumber.text};
    [[SHHTTPManager shareManager] requestSecuritycodeWithParas:paras success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"] intValue] == 0) {
            //完成
        }else{
            SHError *error = [SHError errorWithCode:[[dict objectForKey:@"error"] intValue]];
            showAlert(error.desString);
        }
    } failure:^(NSError *error) {
        showAlert(@"请求失败");
    }];
}

@end
