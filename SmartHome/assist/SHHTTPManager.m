//
//  SHHTTPManager.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHTTPManager.h"

@implementation SHHTTPManager

+ (SHHTTPManager *)shareManager{
    static SHHTTPManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[SHHTTPManager alloc] init];
    });
    return shareManager;
}

//获取验证码
- (void)requestSecuritycodeWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,apply];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//验证验证吗
- (void)requestCheckSecuritycodeWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,verify];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//登录
- (void)requestLoginWithParas:(NSDictionary *)paras
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,login];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//注册
- (void)requestRegisterWithParas:(NSDictionary *)paras
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,shregister];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//重置密码
- (void)requestSetpasswordWithParas:(NSDictionary *)paras
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,setpassword];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//修改昵称
- (void)requestModifynameWithParas:(NSDictionary *)paras
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,modifyname];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//验证密码
- (void)requestVerifypasswordWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,verifypassword];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//重置密码
- (void)requestResetPasswordWithParas:(NSDictionary *)paras
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,shregister];
    [self requestWithURL:requestUrl parameters:paras success:success failure:failure];
}

//获取所有控制
- (void)requestControlWithParas:(NSDictionary *)paras
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",serverAddress,SHControll];
    [self getWithURL:requestUrl parameters:paras success:success failure:failure];
}

//http请求
- (void)requestWithURL:(NSString *)url
            parameters:(NSDictionary *)paras
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure{
    NSDate *date1 = [NSDate date];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
#ifdef DEBUG
        NSDate *date2 = [NSDate date];
        NSTimeInterval time =[date2 timeIntervalSinceDate:date1];
        NSString *string = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@\n耗时%fs",string,time);
#else
        
#endif
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


//http请求
- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)paras
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure{
    NSDate *date1 = [NSDate date];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
#ifdef DEBUG
        NSDate *date2 = [NSDate date];
        NSTimeInterval time =[date2 timeIntervalSinceDate:date1];
        NSString *string = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@\n耗时%fs",string,time);
#else
        
#endif
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
