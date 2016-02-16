//
//  SHDeviceHeadView.h
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SHDeviceHeadViewModel){
    SHDeviceHeadView_Normal,
    SHDeviceHeadView_Small,
};

@interface SHDeviceHeadView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                         type:(SHDeviceHeadViewModel)type;

- (void)setTitle:(NSString *)title image:(NSString *)imageName;

@end
