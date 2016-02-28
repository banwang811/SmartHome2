//
//  SHRoomModel.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

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
