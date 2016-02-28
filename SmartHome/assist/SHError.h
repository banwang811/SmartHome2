//
//  SHError.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHError : NSError

@property (nonatomic, assign) SHErrorType       errorCode;

@property (nonatomic, strong) NSString          *desString;

+ (SHError *)errorWithCode:(SHErrorType)errorCode;

@end
