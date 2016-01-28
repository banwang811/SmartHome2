//
//  SHHomeCell.m
//  SmartHome
//
//  Created by banwang on 16/1/29.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHomeCell.h"

@interface SHHomeCell ()

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;

@property (weak, nonatomic) IBOutlet UILabel *cloudLabel;

@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;

@property (weak, nonatomic) IBOutlet UILabel *wuranLabel;



@end

@implementation SHHomeCell

+ (SHHomeCell *)creatCell:(SHHomeCellType)type{
    SHHomeCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SHHomeCell" owner:self options:0] objectAtIndex:(NSInteger)type];
    return cell;
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
