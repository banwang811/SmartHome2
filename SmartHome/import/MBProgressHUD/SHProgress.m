//
//  SHProgress.m
//  SmartHome
//
//  Created by banwang on 16/3/7.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHProgress.h"

@implementation SHProgress

+ (void)showProgress:(NSString *)str toView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = str;
}

+ (void)hideProgress:(UIView *)view animated:(BOOL)animated{
    [MBProgressHUD hideHUDForView:view animated:animated];
}

@end
