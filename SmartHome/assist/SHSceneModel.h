//
//  SHSceneModel.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SHSceneType){
    SHSceneType_default,
//    SHSceneType_huijia,
//    SHSceneType_lijia,
//    SHSceneType_quankai,
//    SHSceneType_quanguan,
//    SHSceneType_jiucan,
//    SHSceneType_safe,
    SHSceneType_gongzuo,
    SHSceneType_xiyu,
    SHSceneType_xiuxian,
    SHSceneType_yingyuan,
    SHSceneType_suimian,
    SHSceneType_huijia = 100,
    SHSceneType_lijia,
    SHSceneType_quankai,
    SHSceneType_quanguan,
    SHSceneType_jiucan,
    SHSceneType_safe,
};

@interface SHSceneModel : NSObject

@property (nonatomic, strong) NSString                  *sceneID;
@property (nonatomic, strong) NSString                  *user_id;
@property (nonatomic, strong) NSString                  *name;
@property (nonatomic, strong) NSString                  *group;
@property (nonatomic, assign) BOOL                      is_default;
@property (nonatomic, assign) SHSceneType               type;
@property (nonatomic, strong) NSString                  *created_at;
@property (nonatomic, strong) NSString                  *updated_at;
@property (nonatomic, strong) NSString                  *devices;

+ (NSString *)getSceneName:(SHSceneType)type;

+ (NSString *)getSceneIcon:(SHSceneType)type;

@end
