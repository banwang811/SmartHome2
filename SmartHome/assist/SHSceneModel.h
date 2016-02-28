//
//  SHSceneModel.h
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHSceneModel : NSObject

@property (nonatomic, strong) NSString                  *sceneID;
@property (nonatomic, strong) NSString                  *user_id;
@property (nonatomic, strong) NSString                  *name;
@property (nonatomic, strong) NSString                  *group;
@property (nonatomic, assign) BOOL                      is_default;
@property (nonatomic, strong) NSString                  *created_at;
@property (nonatomic, strong) NSString                  *updated_at;
@property (nonatomic, strong) NSMutableArray            *mDevices;

@end
