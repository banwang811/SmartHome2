//
//  SHHTTPManager+Device.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager.h"

@interface SHHTTPManager (Device)

//获取设备
- (void)requestDevicePasswordWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
//修改设备
- (void)requestUpdateDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
//添加设备
- (void)requestAddDeviceWithParas:(NSDictionary *)paras
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

//删除设备
- (void)requestDeleteDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
//设备的操作
- (void)requestOperateDeviceWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

@end
