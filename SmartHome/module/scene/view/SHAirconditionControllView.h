//
//  SHAirconditionControllView.h
//  SmartHome
//
//  Created by banwang on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SHAirconditionControllType){
    SHAirconditionControll_refrigeration,//制冷
    SHDeviceHeadView_heating,//制暖
    SHDeviceHeadView_health,//健康
    SHDeviceHeadView_sleep,//睡眠
};

@interface SHAirconditionControllView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                         type:(SHAirconditionControllType)type;
@end
