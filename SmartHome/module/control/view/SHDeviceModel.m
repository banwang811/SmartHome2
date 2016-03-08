//
//  SHDeviceModel.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHDeviceModel.h"

@implementation SHDeviceModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

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
