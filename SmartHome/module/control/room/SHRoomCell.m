//
//  SHRoomCell.m
//  SmartHome
//
//  Created by banwang on 16/3/1.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHRoomCell.h"

@implementation SHRoomCell

+ (SHRoomCell *)creatCell:(SHRoomCellType)type{
    SHRoomCell *cell = nil;
    switch (type) {
        case SHRoomCellType_info:
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRoomCell" owner:self options:0] objectAtIndex:(NSInteger)type];
            break;
        case SHRoomCellType_level:
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRoomCell" owner:self options:0] objectAtIndex:(NSInteger)type];
            break;
        case SHRoomCellType_save:
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRoomCell" owner:self options:0] objectAtIndex:(NSInteger)type];
            break;
        default:
            break;
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)saveRoom:(UIButton *)sender {
    SHRoomModel *model = [[SHRoomModel alloc] init];
    model.name = self.roomName.text;
    model.floor = self.levelcount.text;
    model.roomType = NSRoomType_Drawing;
    if (self.saveRoom) {
        self.saveRoom(model);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
