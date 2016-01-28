//
//  SHMineCell.m
//  SmartHome
//
//  Created by banwang on 16/1/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHMineCell.h"

typedef NS_ENUM(NSInteger,CellType) {
    SHCellType_normal,
    SHCellType_head
};

@interface SHMineCell ()

@end

@implementation SHMineCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
