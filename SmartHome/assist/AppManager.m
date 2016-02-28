//
//  AppManager.m
//  SmartHome
//
//  Created by banwang on 16/1/9.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager

+ (AppManager *)shareManager{
    static AppManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[AppManager alloc] init];
    });
    return shareManager;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [[UINavigationBar appearance] setBarTintColor:[UIColor themeCoclor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil]];

    appDelegate.window.rootViewController = [[[SHNavigationController alloc] initWithRootViewController:[SHLoginController alloc] ]init];
    return YES;
}

- (BOOL)smallScreen{
    if (SCREEN_WIDTH <= 320) {
        return YES;
    }
    return NO;
}

void showAlert(NSString *message){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

@end
