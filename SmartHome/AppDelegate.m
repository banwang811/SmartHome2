//
//  AppDelegate.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[AppManager shareManager] application:application didFinishLaunchingWithOptions:launchOptions];
    [self.window makeKeyAndVisible];
    return YES;
}

- (SHTabBarController *)tabbarContoller{
    if (_tabbarContoller == nil) {
        _tabbarContoller = [[SHTabBarController alloc] init];
    }
    return _tabbarContoller;
}


@end
