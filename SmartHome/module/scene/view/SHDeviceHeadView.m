//
//  SHDeviceHeadView.m
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceHeadView.h"

@interface SHDeviceHeadView ()

@property (nonatomic, strong) UIImageView                                   *imageView;

@property (nonatomic, strong) UILabel                                       *titleLable;

@property (nonatomic, assign) SHDeviceHeadViewModel                         type;

@property (nonatomic, assign) CGFloat                         headImageWidth;
@property (nonatomic, assign) CGFloat                         headImageHight;
@property (nonatomic, assign) CGFloat                         speace_hight;
@property (nonatomic, assign) CGFloat                         titleLableWidth;
@property (nonatomic, assign) CGFloat                         titleLableHight;
//
@property (nonatomic, assign) CGFloat                         hight;

@end

@implementation SHDeviceHeadView

- (instancetype)initWithFrame:(CGRect)frame
                         type:(SHDeviceHeadViewModel)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        if (type == SHDeviceHeadView_Normal) {
        }else{
        }
        self.headImageHight = 30;
        self.headImageWidth = 30;
        self.speace_hight = 5;
        self.titleLableWidth = 100;
        self.titleLableHight = 25;
        self.hight = (self.frame.size.height - self.headImageHight - self.titleLableHight - self.speace_hight)/2;
        [self addSubview:self.imageView];
        [self addSubview:self.titleLable];
    }
    return self;
}

- (void)setTitle:(NSString *)title image:(NSString *)imageName{
    self.imageView.image = [UIImage imageNamed:imageName];
    self.titleLable.text = title;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        CGFloat width = (self.frame.size.width - self.headImageWidth)/2;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(width, self.hight, self.headImageWidth, self.headImageHight)];
    }
    return _imageView;
}

- (UILabel *)titleLable{
    CGFloat width = (self.frame.size.width - self.titleLableWidth)/2;
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(width, self.frame.size.height - self.titleLableHight - self.hight, self.titleLableWidth, self.titleLableHight)];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

@end
