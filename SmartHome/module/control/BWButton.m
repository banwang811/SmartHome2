//
//  BWButton.m
//  CircleDemo
//
//  Created by mac on 16/2/18.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "BWButton.h"

#define button_width  30
#define button_higth  30

@interface BWButton()

@property (nonatomic, strong) UITapGestureRecognizer            *tapGesture;

@end

@implementation BWButton

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addGestureRecognizer:self.tapGesture];
        self.imageView.image = [UIImage imageNamed:imageName];
        self.titleLabel.text = title;
    }
    return self;
}

- (UITapGestureRecognizer *)tapGesture{
    if (_tapGesture == nil) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    }
    return _tapGesture;
}

- (void)tap:(UITapGestureRecognizer *)Gesture{
    __weak BWButton *weakSelf = self;
    if (self.block) {
        self.block(weakSelf);
    }
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - button_width)/2, 0, button_width, button_higth)];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, button_higth, self.frame.size.width, self.frame.size.height - button_higth)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

@end
