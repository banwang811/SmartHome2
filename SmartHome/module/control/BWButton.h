//
//  BWButton.h
//  CircleDemo
//
//  Created by mac on 16/2/18.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BWButtonType) {
    BWButtonType_outside,
    BWButtonType_middle,
    BWButtonType_inside,
};

@interface BWButton : UIView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title;

@property (nonatomic, strong) UIImageView       *imageView;

@property (nonatomic, strong) UILabel           *titleLabel;

@property (nonatomic, assign) float             startAngle;

@property (nonatomic, assign) float             endAngle;

@property (nonatomic, assign) BWButtonType      type;

@property (nonatomic, copy) void(^block)(BWButton *button);

@end
