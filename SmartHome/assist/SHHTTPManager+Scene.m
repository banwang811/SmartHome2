//
//  SHHTTPManager+Scene.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager+Scene.h"

@implementation SHHTTPManager (Scene)

- (void)requestRecentlySceneWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/%@",serverAddress,scene,recentlyScene];
    [self getWithURL:requestUrl parameters:paras success:success failure:failure];
}


//获取所有情景模式
- (void)requestSceneWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure{
    NSString *sceneID = [paras objectForKey:@"sceneID"];
    NSString *requestUrl = nil;
    if (sceneID == nil) {
        requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,scene];
    }else{
        requestUrl = [NSString stringWithFormat:@"%@%@/%@",serverAddress,scene,sceneID];
    }
    [self getWithURL:requestUrl parameters:paras success:success failure:failure];
}

//添加情景模式
- (void)requestAddScenesWithParas:(NSDictionary *)paras
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,scene];
    [self requestWithURL:requestUrl parameters:nil success:success failure:failure];
}

//更新情景模式
- (void)requestUpdateSceneWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure{
    NSString *sceneID = [paras objectForKey:@"sceneID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@update/%@",serverAddress,scene,sceneID];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//删除情景模式
- (void)requestDeleteDeviceWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure{
    NSString *sceneID = [paras objectForKey:@"sceneID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@delete/%@",serverAddress,scene,sceneID];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//打开情景模式
- (void)requestOperateDeviceWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure{
    NSString *sceneID = [paras objectForKey:@"sceneID"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@/open/%@",serverAddress,scene,sceneID];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

@end
