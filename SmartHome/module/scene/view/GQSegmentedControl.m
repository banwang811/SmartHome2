//
//  GQSegmentedControl.m
//  Investment
//
//  Created by mac on 15/7/31.
//
//

#import "GQSegmentedControl.h"

#define ButtonWidth 44
#define ButtonHeight 24

@interface GQSegmentedControl()

@property (nonatomic, strong)UIButton                                   *leftButton;

@property (nonatomic, strong)UIButton                                   *rightButton;

@property (nonatomic, assign)CGFloat                                    speaceWidth;

@property (nonatomic, assign)CGFloat                                    speaceHeight;

@end

@implementation GQSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.speaceHeight = (self.frame.size.height - ButtonHeight)/2;
        self.speaceWidth = (self.frame.size.width - 2 * ButtonWidth)/2;
        [self layoutContentView];
    }
    return self;
}

- (void)setleftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    [self.leftButton setTitle:leftTitle forState:UIControlStateNormal];
    [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];

}

- (void)layoutSubviews{
    self.speaceHeight = (self.frame.size.height - ButtonHeight)/2;
    self.speaceWidth = (self.frame.size.width - 2 * ButtonWidth)/2;
}

- (void)layoutContentView{
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    self.leftButton.selected = YES;
}

- (UIButton *)leftButton{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(_speaceWidth, _speaceHeight, ButtonWidth, ButtonHeight);
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"open"] forState:UIControlStateSelected];
        [_leftButton addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton{
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(_speaceWidth+ ButtonWidth , _speaceHeight, ButtonWidth, ButtonHeight);
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"open"] forState:UIControlStateSelected];
        [_rightButton addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (void)buttonSelect:(UIButton *)button{
    if (button == _rightButton) {
        _rightButton.selected = YES;
        _leftButton.selected = NO;
        [self.delegate didSelect:GQSegmentedSelect_right];
    }else if (button == _leftButton){
        _rightButton.selected = NO;
        _leftButton.selected = YES;
        [self.delegate didSelect:GQSegmentedSelect_left];
    }
}

@end
