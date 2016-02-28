//
//  SHHTTPManager+Room.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager.h"

@interface SHHTTPManager (Room)

//获取房间(paras为nil则为所有房间)
- (void)requestRoomsWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;
//查询房间里的所有设备
- (void)requestRoomDevicesWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
//往指定房间批量添加设备
- (void)requestAddRoomDevicesWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
//添加房间
- (void)requestAddRoomsWithParas:(NSDictionary *)paras
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

//修改房间
- (void)requestUpdateRoomsWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
//删除房间
- (void)requestDeleteRoomsWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;

@end
