//
//  AppDelegate.h
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHTabBarController.h"
#import "SHLoginController.h"
#import "AppManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) SHTabBarController        *tabbarContoller;

@end

