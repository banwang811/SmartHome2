//
//  SHHTTPManager+Device.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager+Device.h"

@implementation SHHTTPManager (Device)

//获取设备
- (void)requestDevicePasswordWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure{
    NSString *deviceID = [paras objectForKey:@"deviceID"];
    NSString *requestUrl = nil;
    if (deviceID == nil) {
        requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,device];
    }else{
        requestUrl = [NSString stringWithFormat:@"%@%@/%@",serverAddress,device,deviceID];
    }
    [self getWithURL:requestUrl parameters:nil success:success failure:failure];
}

//修改设备
- (void)requestUpdateDeviceWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure{
    NSString *deviceID = [paras objectForKey:@"deviceID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@update/%@",serverAddress,device,deviceID];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//添加设备
- (void)requestAddDeviceWithParas:(NSDictionary *)paras
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,device];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}
//删除设备
- (void)requestDeleteDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure{
    NSString *deviceID = [paras objectForKey:@"deviceID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@delete/%@",serverAddress,device,deviceID];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//设备的操作
- (void)requestOperateDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/action",serverAddress,device];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

@end
