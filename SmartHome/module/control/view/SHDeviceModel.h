//
//  SHDeviceModel.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSDeviceType){
    NSDeviceType_Light = 1,//普通灯
    NSDeviceType_Aircondition,//空调
    NSDeviceType_TV,//电视
    NSDeviceType_Socket,//智能插座
    NSDeviceType_STB,//机顶盒
    NSDeviceType_Camera,//摄像头控制
    NSDeviceType_TalkBack,//门铃对讲
    NSDeviceType_Curtain,//窗帘
    NSDeviceType_Window,//开窗器
    NSDeviceType_FloorHeating,//地暖
    NSDeviceType_DVD,//温湿度传感器
    NSDeviceType_Touying,//投影
    NSDeviceType_Mubu,//幕布
    NSDeviceType_WinKong,//温控
    NSDeviceType_CM,//一氧化碳传感器
    NSDeviceType_CD,//二氧化碳传感器
    NSDeviceType_NT,//新风
    NSDeviceType_EMERGENCY,//紧急按钮
    NSDeviceType_FREEZER,//冰箱
    NSDeviceType_MUSIC,//音乐
};

typedef NS_ENUM(NSInteger, NSDeviceStatusType){
    NSDeviceStatus_temperature,
    NSDeviceStatus_close = 100,
    NSDeviceStatus_open = 101,
};


@interface SHDeviceModel : NSObject

@property (nonatomic, strong) NSString              *deviceID;
@property (nonatomic, strong) NSString              *user_id;
@property (nonatomic, strong) NSString              *room_id;
@property (nonatomic, strong) NSString              *name;
@property (nonatomic, assign) NSDeviceType          type;
@property (nonatomic, strong) NSString              *index;
@property (nonatomic, strong) NSString              *brand;
@property (nonatomic, strong) NSString              *model;
@property (nonatomic, strong) NSString              *imei;
@property (nonatomic, strong) NSString              *nodeID;
@property (nonatomic, strong) NSString              *address;
@property (nonatomic, strong) NSString              *group;
@property (nonatomic, strong) NSString              *infrared;
@property (nonatomic, strong) NSString              *status;
@property (nonatomic, strong) NSString              *updated_at;
@property (nonatomic, strong) NSString              *created_at;

+ (NSString *)getDeviceIcon:(NSDeviceType)type;

+ (NSString *)getDeviceIdentifier:(NSDeviceType)type;

@end
