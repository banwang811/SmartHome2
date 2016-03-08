//
//  SHDeviceCell.h
//  SmartHome
//
//  Created by banwang on 16/3/8.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDeviceCell : UITableViewCell

@property (nonatomic, strong) SHDeviceModel                 *model;

@property (weak, nonatomic) IBOutlet UIButton               *selectButton;

@end
