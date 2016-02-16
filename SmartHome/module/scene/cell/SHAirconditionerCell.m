//
//  SHAirconditionerCell.m
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHAirconditionerCell.h"
#import "SHDeviceHeadView.h"
#import "GQSegmentedControl.h"
#import "SHAirconditionControllView.h"

@interface SHAirconditionerCell ()

@property (nonatomic, strong)  SHDeviceHeadView             *headView;

@property (nonatomic, strong)  GQSegmentedControl           *controllButton;

@property (nonatomic, strong)  GQSegmentedControl           *brightButton;

@property (nonatomic, strong)  UILabel                      *label;

@property (nonatomic, strong)  UILabel                      *temperatureLabel;

//制冷
@property (nonatomic, strong)  SHAirconditionControllView   *refrigerationView;
//制暖
@property (nonatomic, strong)  SHAirconditionControllView   *heatingView;
//健康
@property (nonatomic, strong)  SHAirconditionControllView   *healthView;
//睡眠
@property (nonatomic, strong)  SHAirconditionControllView   *sleepView;

@property (nonatomic, assign)  CGFloat                      width;

@property (nonatomic, assign)  CGFloat                      higth;

@property (nonatomic, assign)  CGFloat                      speace;

@end

@implementation SHAirconditionerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.width = 23;
        self.higth = 51;
        self.speace = 15;
        [self addSubview:self.headView];
        [self addSubview:self.controllButton];
        [self addSubview:self.label];
        [self addSubview:self.brightButton];
        [self addSubview:self.temperatureLabel];
        
        [self addSubview:self.refrigerationView];
        [self addSubview:self.heatingView];
        [self addSubview:self.healthView];
        [self addSubview:self.sleepView];
    }
    return self;
}

- (SHAirconditionControllView *)refrigerationView{
    if (_refrigerationView == nil) {
        _refrigerationView = [[SHAirconditionControllView alloc] initWithFrame:CGRectMake(self.controllButton.frame.origin.x, 65, self.width, self.higth) type:SHAirconditionControll_refrigeration];
    }
    return _refrigerationView;
}

- (SHAirconditionControllView *)heatingView{
    if (_heatingView == nil) {
        _heatingView = [[SHAirconditionControllView alloc] initWithFrame:CGRectMake(self.refrigerationView.frame.origin.x + self.width + self.speace, 65, self.width, self.higth) type:SHDeviceHeadView_heating];
    }
    return _heatingView;
}

- (SHAirconditionControllView *)healthView{
    if (_healthView == nil) {
        _healthView = [[SHAirconditionControllView alloc] initWithFrame:CGRectMake(self.heatingView.frame.origin.x + self.width+self.speace, 65, self.width, self.higth) type:SHDeviceHeadView_heating];
    }
    return _healthView;
}

- (SHAirconditionControllView *)sleepView{
    if (_sleepView == nil) {
        _sleepView = [[SHAirconditionControllView alloc] initWithFrame:CGRectMake(self.healthView.frame.origin.x + self.width + self.speace, 65, self.width, self.higth) type:SHDeviceHeadView_heating];
    }
    return _sleepView;
}

- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(self.controllButton.frame.origin.x + self.controllButton.frame.size.width, 30, 40, 24)];
        _label.text = @"温度";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12];
    }
    return _label;
}

- (UILabel *)temperatureLabel{
    if (_temperatureLabel == nil) {
        _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 24)];
        _temperatureLabel.center = CGPointMake(self.brightButton.center.x, 20);
        _temperatureLabel.text = @"0摄氏度";
        _temperatureLabel.textAlignment = NSTextAlignmentCenter;
        _temperatureLabel.font = [UIFont systemFontOfSize:12];
    }
    return _temperatureLabel;
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
