//
//  SHSceneModel.m
//  SmartHome
//
//  Created by banwang on 16/2/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSceneModel.h"

@implementation SHSceneModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+ (NSString *)getSceneName:(SHSceneType)type{
    switch (type) {
        case SHSceneType_default:
            return @"自定义模式";
            break;
        case SHSceneType_huijia:
            return @"回家模式";
            break;
        case SHSceneType_lijia:
            return @"离家模式";
            break;
        case SHSceneType_quankai:
            return @"全开模式";
            break;
        case SHSceneType_quanguan:
            return @"全关模式";
            break;
        case SHSceneType_jiucan:
            return @"就餐模式";
            break;
        case SHSceneType_safe:
            return @"安全模式";
            break;
        case SHSceneType_suimian:
            return @"睡眠模式";
            break;
        case SHSceneType_gongzuo:
            return @"工作模式";
            break;
        case SHSceneType_xiyu:
            return @"洗浴模式";
            break;
        case SHSceneType_xiuxian:
            return @"休闲模式";
            break;
        case SHSceneType_yingyuan:
            return @"影院模式";
            break;
        default:
            break;
    }
}

+ (NSString *)getSceneIcon:(SHSceneType)type{
    switch (type) {
        case SHSceneType_default:
            return @"zidingyi";
            break;
        case SHSceneType_huijia:
            return @"huijia";
            break;
        case SHSceneType_lijia:
            return @"lijia";
            break;
        case SHSceneType_quankai:
            return @"quankai";
            break;
        case SHSceneType_quanguan:
            return @"quanguan";
            break;
        case SHSceneType_jiucan:
            return @"jiucan";
            break;
        case SHSceneType_safe:
            return @"safe";
            break;
        case SHSceneType_gongzuo:
            return @"gongzuo";
            break;
        case SHSceneType_xiyu:
            return @"xiyu";
            break;
        case SHSceneType_xiuxian:
            return @"xiuxian";
            break;
        case SHSceneType_yingyuan:
            return @"yingyuan";
            break;
        case SHSceneType_suimian:
            return @"suimian";
            break;
        default:
            return @"tianjia";
            break;
    }
}


@end
