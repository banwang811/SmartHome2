//
//  SHLightCell.m
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHLightCell.h"
#import "SHDeviceHeadView.h"
#import "GQSegmentedControl.h"

@interface SHLightCell ()

@property (nonatomic, strong)  SHDeviceHeadView             *headView;

@property (nonatomic, strong)  GQSegmentedControl           *controllButton;

@property (nonatomic, strong)  GQSegmentedControl           *brightButton;

@property (nonatomic, strong)  UILabel                      *label;

@end

@implementation SHLightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.headView];
        [self addSubview:self.controllButton];
        [self addSubview:self.label];
        [self addSubview:self.brightButton];
    }
    return self;
}

- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(self.controllButton.frame.origin.x + self.controllButton.frame.size.width, 30, 40, 24)];
        _label.text = @"亮度";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12];
    }
    return _label;
}

- (SHDeviceHeadView *)headView{
    if (_headView == nil) {
        _headView = [[SHDeviceHeadView alloc] initWithFrame:CGRectMake(0, 0, 40, 100) type:SHDeviceHeadView_Small];
        [_headView setTitle:@"电视" image:@"tv"];
    }
    return _headView;
}

- (GQSegmentedControl *)controllButton{
    if (_controllButton == nil) {
        _controllButton = [[GQSegmentedControl alloc] initWithFrame:CGRectMake(self.headView.frame.size.width, 30, 88, 24)];
        [_controllButton setleftTitle:@"开" rightTitle:@"关"];
    }
    return _controllButton;
}

- (GQSegmentedControl *)brightButton{
    if (_brightButton == nil) {
        _brightButton = [[GQSegmentedControl alloc] initWithFrame:CGRectMake(self.label.frame.origin.x + self.label.frame.size.width, 30, 88, 24)];
        [_brightButton setleftTitle:@"+" rightTitle:@"-"];
    }
    return _brightButton;
}

- (void)drawRect:(CGRect)rect{
    
}

@end
