//
//  CacheManager.h
//  SmartHome
//
//  Created by banwang on 16/3/9.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

@property (nonatomic, strong) NSMutableDictionary         *devicesDicts;

@property (nonatomic, strong) NSMutableDictionary         *roomsDicts;

@property (nonatomic, strong) NSMutableDictionary         *scenesDicts;

+ (CacheManager *)shareManager;

@end
