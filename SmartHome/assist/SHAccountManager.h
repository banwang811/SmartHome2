//
//  SHAccountManager.h
//  SmartHome
//
//  Created by banwang on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAccountManager : NSObject

@property (nonatomic, strong) NSString      *account;
@property (nonatomic, strong) NSString      *password;
@property (nonatomic, strong) NSString      *name;
@property (nonatomic, strong) NSString      *nickname;
@property (nonatomic, strong) NSString      *userId;
@property (nonatomic, strong) NSString      *email;
@property (nonatomic, strong) NSString      *phone;
@property (nonatomic, strong) NSString      *role;
@property (nonatomic, strong) NSString      *sex;
@property (nonatomic, strong) NSString      *created_at;
@property (nonatomic, strong) NSString      *updated_at;
@property (nonatomic, strong) NSString      *verificationCode;

+ (SHAccountManager *)shareManager;

@end
