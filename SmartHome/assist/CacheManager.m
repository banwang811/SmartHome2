//
//  CacheManager.m
//  SmartHome
//
//  Created by banwang on 16/3/9.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager

+ (CacheManager *)shareManager{
    static CacheManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[CacheManager alloc] init];
    });
    return shareManager;
}

- (instancetype)init{
    if (self = [super init]) {
        self.devicesDicts = [NSMutableDictionary dictionary];
    }
    return self;
}


@end
