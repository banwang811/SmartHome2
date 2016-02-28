//
//  SHError.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHError.h"

@implementation SHError

+ (SHError *)errorWithCode:(SHErrorType)errorCode{
    SHError *error = [[SHError alloc] init];
    error.errorCode = errorCode;
    error.desString = [SHError getErrorDescription:errorCode];
    return error;
}

+ (NSString *)getErrorDescription:(SHErrorType)errorCode{
    NSString *description = nil;
    switch (errorCode) {
        case SHError_invalidlogin:
            description = @"";
            break;
        default:
            break;
    }
    return description;
}

@end
