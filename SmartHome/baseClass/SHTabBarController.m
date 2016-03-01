//
//  SHTabBarController.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHTabBarController.h"

@interface SHTabBarController ()

@end

@implementation SHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeController = [[SHHomeController alloc]init];
    SHNavigationController *home = [[SHNavigationController alloc] initWithRootViewController:self.homeController];
    
    self.controlController = [[SHControllController alloc] init];
    SHNavigationController *control = [[SHNavigationController alloc] initWithRootViewController:self.controlController];
    
    self.sceneController = [[SHSceneController alloc] init];
    SHNavigationController *sceneController = [[SHNavigationController alloc] initWithRootViewController:self.sceneController];
    
    self.mineController = [[SHMineController alloc] init];
    SHNavigationController *mine = [[SHNavigationController alloc] initWithRootViewController:self.mineController];
    self.viewControllers = [NSArray arrayWithObjects:home,control,sceneController,mine, nil];
    
    [self setItems];
}

- (void)setItems{
    NSArray *titles = [NSArray arrayWithObjects:@"首页",@"控制",@"场景",@"我的", nil];
    for (int i = 0; i < 4; i++) {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:i];
        item.title = titles[i];
        UIImage *unselectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%d.png",i+1]];
        UIImage *selectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%d_select.png",i+1]];//
        [item setFinishedSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
           withFinishedUnselectedImage:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:RGB(126, 124, 124, 1), nil]
                                                                 forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor, nil]] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:RGB(69, 150, 206, 1), nil]
                                                                 forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor, nil]] forState:UIControlStateSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
