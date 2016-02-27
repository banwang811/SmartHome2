//
//  SHLightControllView.m
//  SmartHome
//
//  Created by banwang on 16/2/27.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHLightControllView.h"

@interface SHLightControllView ()

@property (nonatomic, strong) UILabel               *label1;

@property (nonatomic, strong) UILabel               *label2;

@property (nonatomic, strong) UILabel               *label3;

@property (nonatomic, assign) CGFloat               space_width;

@property (nonatomic, assign) CGFloat               space_higth;

@end

@implementation SHLightControllView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.space_higth = 50;
        self.space_width = 50;
        [self addSubview:self.progressView1];
        [self addSubview:self.progressView2];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self addSubview:self.label3];
    }
    return self;
}


- (UISlider *)progressView1{
    if (_progressView1 == nil) {
        _progressView1 = [[UISlider alloc] initWithFrame:CGRectMake(_space_width, _space_higth,SCREEN_WIDTH - 2*_space_width, 44)];
    }
    return _progressView1;
}

- (UISlider *)progressView2{
    if (_progressView2 == nil) {
        _progressView2 = [[UISlider alloc] initWithFrame:CGRectMake(_space_width, _space_higth *2 + 44,SCREEN_WIDTH - 2*_space_width, 44)];
    }
    return _progressView2;
}

- (UILabel *)label1{
    if (_label1 == nil) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(_space_width + 5, _space_higth - 15, 20, 12)];
        _label1.textColor = [UIColor whiteColor];
        _label1.text = @"强";
        _label1.font = [UIFont systemFontOfSize:12];
    }
    return _label1;
}

- (UILabel *)label2{
    if (_label2 == nil) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - _space_width - 20 - 5, _space_higth - 15, 20, 12)];
        _label2.textColor = [UIColor whiteColor];
        _label2.textAlignment = NSTextAlignmentRight;
        _label2.text = @"弱";
        _label2.font = [UIFont systemFontOfSize:12];
    }
    return _label2;
}

- (UILabel *)label3{
    if (_label3 == nil) {
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(_space_width + 5, _space_higth *2 + 44 - 15, 40, 12)];
        _label3.textColor = [UIColor whiteColor];
        _label3.text = @"色温";
        _label3.font = [UIFont systemFontOfSize:12];
    }
    return _label3;
}



@end
