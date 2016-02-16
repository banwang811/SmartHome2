//
//  SHSceneCell.m
//  SmartHome
//
//  Created by banwang on 16/1/31.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSceneCell.h"

#define speace_height   13

@interface SHSceneCell ()

@property (nonatomic, strong) UIImageView           *backImageView;

@end

@implementation SHSceneCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2;
        self.clipsToBounds = YES;
        [self addSubview:self.backImageView];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backImageView.image = [UIImage imageNamed:@"scene_bg"];
    }
    return _backImageView;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        CGFloat orginY = (self.frame.size.height - self.frame.size.width/2 - 20 - speace_height)/2 ;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/4, orginY, self.frame.size.width/2, self.frame.size.width/2)];
        _imageView.image = [UIImage imageNamed:@"suimian"];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        CGFloat orginY = self.frame.size.height -((self.frame.size.height - self.frame.size.width/2 - 20 - speace_height)/2 + 20) ;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,orginY , self.frame.size.width - 10, 20)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"离家模式";
    }
    return _titleLabel;
}

@end
