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
    SHSetPasswordController *controller = [[SHSetPasswordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSDictionary *parameter=@{};
//    [manager POST:serverAddress parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}

- (IBAction)getVerificationCode:(UIButton *)sender {
    
}

@end
