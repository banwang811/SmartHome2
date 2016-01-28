//
//  SHHomeCell.h
//  SmartHome
//
//  Created by banwang on 16/1/29.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SHHomeCellType) {
    SHHomeCellType_huanjing,
    SHHomeCellType_model,
    SHHomeCellType_warn,
    SHHomeCellType_message
};

@interface SHHomeCell : UITableViewCell

+ (SHHomeCell *)creatCell:(SHHomeCellType)type;

@end
