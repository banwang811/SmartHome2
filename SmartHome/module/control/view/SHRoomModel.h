//
//  SHRoomModel.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 1 客厅
 2 卧室
 3 厨房
 4 卫生间
 5 书房
 6 儿童间
 7 衣帽间
 8 餐厅
 9 家庭影院
 */
typedef NS_ENUM(NSInteger, NSRoomType){
    NSRoomType_Drawing = 1,
    NSRoomType_Bedroom,
    NSRoomType_Kitchen,
    NSRoomType_Toliet,
    NSRoomType_Study,
    NSRoomType_Child,
    NSRoomType_Clothse,
    NSRoomType_Eatting,
    NSRoomType_Movie,
};

@interface SHRoomModel : NSObject

@property (nonatomic, strong) NSString          *roomId;
@property (nonatomic, strong) NSString          *user_id;
@property (nonatomic, strong) NSString          *floor;
@property (nonatomic, strong) NSString          *name;
@property (nonatomic, strong) NSString          *group;
@property (nonatomic, strong) NSString          *created_at;
@property (nonatomic, strong) NSString          *updated_at;
@property (nonatomic, assign) NSRoomType        roomType;

@end
