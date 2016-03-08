//
//  SHHTTPManager+Scene.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager.h"

@interface SHHTTPManager (Scene)

- (void)requestSceneWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

//添加情景模式
- (void)requestAddScenesWithParas:(NSDictionary *)paras
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

//更新情景模式
- (void)requestUpdateSceneWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;

//删除情景模式
- (void)requestDeleteDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

//打开情景模式
- (void)requestOperateDeviceWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;
@end
