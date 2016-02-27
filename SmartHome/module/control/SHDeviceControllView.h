//
//  SHDeviceControllView.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BWDeviceType) {
    BWDeviceType_light,
    BWDeviceType_airconditioner,
    BWDeviceType_window,
};

@interface SHDeviceControllView : UIView

- (instancetype)initWithFrame:(CGRect)frame viewType:(BWDeviceType)type;

- (void)layoutContentView:(BWDeviceType)type;

@end
