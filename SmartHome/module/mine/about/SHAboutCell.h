//
//  SHAboutCell.h
//  SmartHome
//
//  Created by banwang on 16/1/29.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHAboutCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView        *iconImage;

@property (weak, nonatomic) IBOutlet UILabel            *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel            *content;

@end
