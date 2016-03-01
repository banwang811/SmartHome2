//
//  SHNoteView.m
//  SmartHome
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHNoteView.h"

NSString * const SHDidSelectNotifacation = @"SHDidSelectNotifacation";

@interface SHNoteView ()

@property (nonatomic, strong)   UIImageView             *jiantouView;

@property (nonatomic, strong)   UIButton                *addDeviceButton;

@property (nonatomic, strong)   UIButton                *addRoomButton;

@property (nonatomic, strong)   UILabel                 *line;


@end

@implementation SHNoteView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.jiantouView];
        [self addSubview:self.addDeviceButton];
        [self addSubview:self.addRoomButton];
        [self addSubview:self.line];
    }
    return self;
}

- (UIImageView *)jiantouView{
    if (_jiantouView == nil) {
        _jiantouView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 35, 0, 15, 13)];
        _jiantouView.image = [UIImage imageNamed:@"controll_jiantou"];
    }
    return _jiantouView;
}

- (UIButton *)addDeviceButton{
    if (_addDeviceButton == nil) {
        _addDeviceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addDeviceButton.frame = CGRectMake(0, 13,self.frame.size.width, 40);
        _addDeviceButton.backgroundColor = RGB(37, 83, 116, 1);
        _addDeviceButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_addDeviceButton setTitle:@"添加设备" forState:UIControlStateNormal];
        [_addDeviceButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_addDeviceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _addDeviceButton;
}

- (UIButton *)addRoomButton{
    if (_addRoomButton == nil) {
        _addRoomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addRoomButton.frame = CGRectMake(0, 13 + 40,self.frame.size.width, 40);
        _addRoomButton.backgroundColor = RGB(37, 83, 116, 1);
        _addRoomButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_addRoomButton setTitle:@"添加房间" forState:UIControlStateNormal];
        [_addRoomButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_addRoomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _addRoomButton;
}

- (UILabel *)line{
    if (_line == nil) {
        _line = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - 70)/2, 13 + 40, 70, 0.5)];
        _line.backgroundColor = [UIColor whiteColor];
    }
    return _line;
}

- (void)buttonClick:(UIButton *)button{
    if(button == self.addDeviceButton){
        [[NSNotificationCenter defaultCenter] postNotificationName:SHDidSelectNotifacation object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"addDevice",@"type", nil]];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:SHDidSelectNotifacation object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"addRoom",@"type", nil]];
    }
}

@end
