//
//  SHDeviceModel.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceModel.h"

@implementation SHDeviceModel

- (id)copyWithZone:(NSZone *)zone{
    SHDeviceModel *model = [[SHDeviceModel allocWithZone:zone] init];
    model.deviceID = [_deviceID copy];
    model.user_id = [_user_id copy];
    model.room_id = [_room_id copy];
    model.name = [_name copy];
    model.type = _type;
    model.status = _status;
    model.index = [_index copy];
    model.brand = [_brand copy];
    model.model = [_model copy];
    model.imei = [_imei copy];
    model.nodeID = [_nodeID copy];
    model.address = [_address copy];
    model.group = [_group copy];
    model.infrared = [_infrared copy];
    model.updated_at = [_updated_at copy];
    model.created_at = [_created_at copy];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+ (NSString *)getDeviceIcon:(NSDeviceType)type{
    switch (type) {
        case NSDeviceType_Light:
            return @"device_light";
            break;
        case NSDeviceType_Curtain:
            return @"blind";
            break;
        case NSDeviceType_Aircondition:
            return @"aircondition";
            break;
        case NSDeviceType_TV:
            return @"tv";
            break;
        case NSDeviceType_Socket:
            return @"NSDeviceType_Socket";
            break;
        case NSDeviceType_STB:
            return @"NSDeviceType_STB";
            break;
        case NSDeviceType_Camera:
            return @"NSDeviceType_Camera";
            break;
        case NSDeviceType_TalkBack:
            return @"NSDeviceType_TalkBack";
            break;
        case NSDeviceType_Window:
            return @"NSDeviceType_Window";
            break;
        case NSDeviceType_FloorHeating:
            return @"NSDeviceType_FloorHeating";
            break;
        case NSDeviceType_DVD:
            return @"NSDeviceType_DVD";
            break;
        case NSDeviceType_Touying:
            return @"NSDeviceType_Touying";
            break;
        default:
            return @"music";
            break;
    }
    
}

+ (NSString *)getDeviceIdentifier:(NSDeviceType)type{
    switch (type) {
        case NSDeviceType_Light:
            return @"NSDeviceType_Light";
            break;
        case NSDeviceType_Curtain:
            return @"NSDeviceType_Curtain";
            break;
        case NSDeviceType_Aircondition:
            return @"NSDeviceType_Aircondition";
            break;
        case NSDeviceType_TV:
            return @"NSDeviceType_TV";
            break;
        case NSDeviceType_Socket:
            return @"NSDeviceType_Socket";
            break;
        case NSDeviceType_STB:
            return @"NSDeviceType_STB";
            break;
        case NSDeviceType_Camera:
            return @"NSDeviceType_Camera";
            break;
        case NSDeviceType_TalkBack:
            return @"NSDeviceType_TalkBack";
            break;
        case NSDeviceType_Window:
            return @"NSDeviceType_Window";
            break;
        case NSDeviceType_FloorHeating:
            return @"NSDeviceType_FloorHeating";
            break;
        case NSDeviceType_DVD:
            return @"NSDeviceType_DVD";
            break;
        case NSDeviceType_Touying:
            return @"NSDeviceType_Touying";
            break;
        default:
            return @"NSDeviceType_Mubu";
            break;
    }

}

@end
