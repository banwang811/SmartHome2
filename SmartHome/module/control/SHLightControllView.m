//
//  SHLightControllView.m
//  SmartHome
//
//  Created by banwang on 16/2/27.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHLightControllView.h"

@interface SHLightControllView ()

@property (nonatomic, assign) CGFloat               space_width;

@property (nonatomic, assign) CGFloat               space_higth;

@end

@implementation SHLightControllView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.space_higth = 60;
        self.space_width = 50;
    }
    return self;
}


- (UIProgressView *)progressView1{
    if (_progressView1 == nil) {
        _progressView1 = [[UIProgressView alloc] initWithFrame:CGRectMake(_space_width, _space_higth,SCREEN_WIDTH - 2*_space_width, 44)];
    }
    return _progressView1;
}

- (UIProgressView *)progressView2{
    if (_progressView2 == nil) {
        _progressView2 = [[UIProgressView alloc] initWithFrame:CGRectMake(_space_width, _space_higth *2 + 44,SCREEN_WIDTH - 2*_space_width, 44)];
    }
    return _progressView2;
}


@end
