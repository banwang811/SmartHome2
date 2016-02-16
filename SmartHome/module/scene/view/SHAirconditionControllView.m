//
//  SHAirconditionControllView.m
//  SmartHome
//
//  Created by banwang on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHAirconditionControllView.h"

@interface SHAirconditionControllView ()

@property (nonatomic, strong) UIButton                                      *imageButton;

@property (nonatomic, strong) UILabel                                       *titleLable;

@property (nonatomic, assign) SHAirconditionControllType                    type;

@property (nonatomic, assign) CGFloat                         headImageWidth;
@property (nonatomic, assign) CGFloat                         headImageHight;
@property (nonatomic, assign) CGFloat                         speace_hight;
@property (nonatomic, assign) CGFloat                         titleLableWidth;
@property (nonatomic, assign) CGFloat                         titleLableHight;
//
@property (nonatomic, assign) CGFloat                         hight;

@end

@implementation SHAirconditionControllView

- (instancetype)initWithFrame:(CGRect)frame
                         type:(SHAirconditionControllType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        self.headImageHight = 23;
        self.headImageWidth = 23;
        self.speace_hight = 2;
        self.titleLableWidth = 23;
        self.titleLableHight = 23;
        self.hight = (self.frame.size.height - self.headImageHight - self.titleLableHight - self.speace_hight)/2;
        [self addSubview:self.imageButton];
        [self addSubview:self.titleLable];
    }
    return self;
}

- (UIButton *)imageButton{
    if (_imageButton == nil) {
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = (self.frame.size.width - self.headImageWidth)/2;
        _imageButton.frame = CGRectMake(width, self.hight, self.headImageWidth, self.headImageHight);
        [_imageButton setImage:[UIImage imageNamed:@"refrigeration"] forState:UIControlStateNormal];
        [_imageButton setImage:[UIImage imageNamed:@"refrigeration_select"] forState:UIControlStateSelected];
    }
    return _imageButton;
}

- (UILabel *)titleLable{
    CGFloat width = (self.frame.size.width - self.titleLableWidth)/2;
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(width, self.frame.size.height - self.titleLableHight - self.hight, self.titleLableWidth, self.titleLableHight)];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.text = @"制冷";
        _titleLable.font = [UIFont systemFontOfSize:10];
    }
    return _titleLable;
}

@end
