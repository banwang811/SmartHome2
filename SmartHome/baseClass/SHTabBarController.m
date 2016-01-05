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
    
    self.controlController = [[SHControlController alloc] init];
    SHNavigationController *control = [[SHNavigationController alloc] initWithRootViewController:self.controlController];
    
    self.sceneController = [[SHSceneController alloc] init];
    SHNavigationController *scene = [[SHNavigationController alloc] initWithRootViewController:self.sceneController];
    
    self.mineController = [[SHMineController alloc] init];
    SHNavigationController *mine = [[SHNavigationController alloc] initWithRootViewController:self.mineController];
    self.viewControllers = [NSArray arrayWithObjects:home,control,scene,mine, nil];
    
    [self setItems];
}

- (void)setItems{
    NSArray *titles = [NSArray arrayWithObjects:@"首页",@"控制",@"场景",@"我的", nil];
    for (int i = 0; i < 4; i++) {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:i];
        item.title = titles[i];
        UIImage *selectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"nav_%db.png",i+1]];
        UIImage *unselectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"nav_%da.png",i+1]];//
        [item setFinishedSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
           withFinishedUnselectedImage:[unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], nil]
                                                                 forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor, nil]] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor redColor], nil]
                                                                 forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor, nil]] forState:UIControlStateSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
