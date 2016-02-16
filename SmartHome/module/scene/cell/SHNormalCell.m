//
//  SHNormalCell.m
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHNormalCell.h"
#import "GQSegmentedControl.h"
#import "SHDeviceHeadView.h"

#define originX 50 

@interface SHNormalCell()

@property (nonatomic, strong)  SHDeviceHeadView             *headView;

@property (nonatomic, strong)  GQSegmentedControl           *controllButton;

@end

@implementation SHNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.headView];
        [self addSubview:self.controllButton];
    }
    return self;
}

- (SHDeviceHeadView *)headView{
    if (_headView == nil) {
        _headView = [[SHDeviceHeadView alloc] initWithFrame:CGRectMake(originX, 0, 50, 100) type:SHDeviceHeadView_Small];
        [_headView setTitle:@"电视" image:@"tv"];
    }
    return _headView;
}

- (GQSegmentedControl *)controllButton{
    if (_controllButton == nil) {
        _controllButton = [[GQSegmentedControl alloc] initWithFrame:CGRectMake(originX + 15 + self.headView.frame.size.width, 30, 88, 24)];
        [_controllButton setleftTitle:@"开" rightTitle:@"关"];
    }
    return _controllButton;
}

- (void)drawRect:(CGRect)rect{
    
}

@end
