//
//  SHMenuCell.m
//  Select
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHMenuCell.h"
#import "SHDeviceHeadView.h"

@interface SHMenuCell ()

@property (nonatomic, strong) SHDeviceHeadView              *headView;

@property (nonatomic, assign) CGFloat                       width;

@end

@implementation SHMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if ([[AppManager shareManager] smallScreen]) {
            self.width = 60;
        }else{
            self.width = 80;
        }
        [self addSubview:self.headView];
    }
    return self;
}

- (SHDeviceHeadView *)headView{
    if (_headView == nil) {
        _headView = [[SHDeviceHeadView alloc] initWithFrame:CGRectMake(0, 0, self.width, 100) type:SHDeviceHeadView_Small];
        [_headView setTitle:@"电视" image:@"tv"];
    }
    return _headView;
}

@end
