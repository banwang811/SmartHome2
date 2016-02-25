//
//  SHTabBarController.h
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNavigationController.h"
#import "SHHomeController.h"
#import "SHSceneController.h"
#import "SHMineController.h"
#import "SHControllController.h"

@interface SHTabBarController : UITabBarController

@property (nonatomic, strong) SHHomeController                  *homeController;

@property (nonatomic, strong) SHControllController               *controlController;

@property (nonatomic, strong) SHSceneController                 *sceneController;

@property (nonatomic, strong) SHMineController                  *mineController;

@end
