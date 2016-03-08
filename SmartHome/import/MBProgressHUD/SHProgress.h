//
//  SHProgress.h
//  SmartHome
//
//  Created by banwang on 16/3/7.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHProgress : NSObject

+ (void)showProgress:(NSString *)str toView:(UIView *)view;

+ (void)hideProgress:(UIView *)view animated:(BOOL)animated;

@end
