//
//  SHDeviceCell.m
//  SmartHome
//
//  Created by banwang on 16/3/8.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceCell.h"

@interface SHDeviceCell ()

@property (weak, nonatomic) IBOutlet UIImageView            *headImageView;

@property (weak, nonatomic) IBOutlet UILabel                *deviceName;

@property (nonatomic, strong) UILabel                       *line;

@end

@implementation SHDeviceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(SHDeviceModel *)model{
    _model = model;
    _headImageView.image = [UIImage imageNamed:[SHDeviceModel getDeviceIcon:model.type]];
    _deviceName.text = model.name;
    _selectButton.hidden = YES;
    [self addSubview:self.line];
}

- (UILabel *)line{
    if (_line == nil) {
        _line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, gScreenwidth, 0.5)];
        _line.backgroundColor = RGB(237, 237, 237, 1);
    }
    return _line;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
