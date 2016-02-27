//
//  SHDeviceControllView.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceControllView.h"
#import "SHControllView.h"
#import "SHLightControllView.h"
#import "SHWindowControllView.h"

@interface SHDeviceControllView ()

@property (nonatomic, strong) SHControllView                *controllView;

@property (nonatomic, assign) BWDeviceType                  type;

@end

@implementation SHDeviceControllView

- (instancetype)initWithFrame:(CGRect)frame viewType:(BWDeviceType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        [self layoutContentView:type];
    }
    return self;
}

- (void)layoutContentView:(BWDeviceType)type{
    [self.controllView removeFromSuperview];
    switch (type) {
        case BWDeviceType_light:
            self.controllView = [[SHLightControllView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,self.frame.size.height)];
            break;
        case BWDeviceType_window:
            self.controllView = [[SHWindowControllView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,self.frame.size.height)];
            break;
        default:
            break;
    }
    [self addSubview:self.controllView];
}


@end
