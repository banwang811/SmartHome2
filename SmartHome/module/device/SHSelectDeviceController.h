//
//  SHSelectDeviceController.h
//  SmartHome
//
//  Created by banwang on 16/3/8.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHBaseViewController.h"

@interface SHSelectDeviceController : SHBaseViewController

@property (nonatomic, strong) NSString                  *sceneID;

@property (nonatomic, strong) NSMutableDictionary       *selectedDicts;

@end
