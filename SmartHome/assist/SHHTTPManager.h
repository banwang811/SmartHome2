//
//  SHHTTPManager.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHHTTPManager : NSObject

+ (SHHTTPManager *)shareManager;

//获取验证码
- (void)requestSecuritycodeWithParas:(NSDictionary *)paras
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

//验证验证吗
- (void)requestCheckSecuritycodeWithParas:(NSDictionary *)paras
                                  success:(void (^)(id responseObject))success
                                  failure:(void (^)(NSError *error))failure;

//登录
- (void)requestLoginWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;
//注册
- (void)requestRegisterWithParas:(NSDictionary *)paras
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;
//重置密码
- (void)requestSetpasswordWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
//修改昵称
- (void)requestModifynameWithParas:(NSDictionary *)paras
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;
//验证密码
- (void)requestVerifypasswordWithParas:(NSDictionary *)paras
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
//重置密码
- (void)requestResetPasswordWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

//获取所有控制
- (void)requestControlWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

- (void)requestWithURL:(NSString *)url
            parameters:(NSDictionary *)paras
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

//http请求
- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)paras
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;
@end
