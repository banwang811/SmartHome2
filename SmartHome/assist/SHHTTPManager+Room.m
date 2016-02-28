//
//  SHHTTPManager+Room.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager+Room.h"

@implementation SHHTTPManager (Room)

//获取房间(paras为nil则为所有房间)
- (void)requestRoomsWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure{
    NSString *roomID = [paras objectForKey:@"roomID"];
    NSString *requestUrl = nil;
    if (roomID == nil) {
        requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,room];
    }else{
        requestUrl = [NSString stringWithFormat:@"%@%@/%@",serverAddress,room,roomID];
    }
    [self getWithURL:requestUrl parameters:nil success:success failure:failure];
}

//查询房间里的所有设备
- (void)requestRoomDevicesWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure{
    NSString *roomID = [paras objectForKey:@"roomID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/device",serverAddress,roomID];
    [self getWithURL:requestUrl parameters:nil success:success failure:failure];
}

//往指定房间批量添加设备
- (void)requestAddRoomDevicesWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,room];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//添加房间
- (void)requestAddRoomsWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,room];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//修改房间
- (void)requestUpdateRoomsWithParas:(NSDictionary *)paras
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure{
    NSString *roomID = [paras objectForKey:@"roomID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/update/%@",serverAddress,room,roomID];
    [self requestWithURL:requestUrl parameters:nil success:success failure:failure];
}

//删除房间
- (void)requestDeleteRoomsWithParas:(NSDictionary *)paras
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure{
    NSString *roomID = [paras objectForKey:@"roomID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/delete/%@",serverAddress,room,roomID];
    [self requestWithURL:requestUrl parameters:nil success:success failure:failure];
}

@end
