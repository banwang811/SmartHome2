//
//  SHWindowControllView.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHWindowControllView.h"

@interface SHWindowControllView ()

@property (nonatomic, strong) UIButton          *colseButton;

@property (nonatomic, strong) UIButton          *openButton;

@property (nonatomic, strong) UIImageView       *imageView;

@end

@implementation SHWindowControllView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.space_width = 70;
        self.space_higth = 0;
        [self addSubview:self.colseButton];
        [self addSubview:self.openButton];
        [self addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
        _imageView.image = [UIImage imageNamed:@"controll_widindow_change"];
        _imageView.center = self.center;
    }
    return _imageView;
}

- (UIButton *)openButton{
    if (_openButton == nil) {
        _openButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _openButton.frame = CGRectMake(self.space_width, self.space_higth, 70, 70);
        _openButton.center = CGPointMake(gScreenwidth - 70 - 35 , self.center.y);
        [_openButton setImage:[UIImage imageNamed:@"controll_window_open"] forState:UIControlStateNormal];
    }
    return _openButton;
}

- (UIButton *)colseButton{
    if (_colseButton == nil) {
        _colseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _colseButton.frame = CGRectMake(gScreenwidth - 70 - self.space_width, self.space_higth, 70, 70);
        _colseButton.center = CGPointMake(self.space_width + 35 , self.center.y);
        [_colseButton setImage:[UIImage imageNamed:@"controll_window_close"] forState:UIControlStateNormal];
    }
    return _colseButton;
}

@end
