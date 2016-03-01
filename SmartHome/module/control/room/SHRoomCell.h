//
//  SHRoomCell.h
//  SmartHome
//
//  Created by banwang on 16/3/1.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SHRoomCellType){
    SHRoomCellType_info,
    SHRoomCellType_level,
    SHRoomCellType_save,
};

@interface SHRoomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *roomName;
@property (weak, nonatomic) IBOutlet UITextField *levelcount;
@property (weak, nonatomic) IBOutlet UITextField  *roomType;

@property (nonatomic, strong) SHRoomModel               *model;

@property (nonatomic, copy) void(^saveRoom)(SHRoomModel * model);

@property (nonatomic, copy) void(^selectRoomType)();

+ (SHRoomCell *)creatCell:(SHRoomCellType)type;


@end
