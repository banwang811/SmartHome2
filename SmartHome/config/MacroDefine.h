//
//  MacroDefine.h
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h

#define appDelegate  ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define IOS_7_OR_LATER ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define IOS_8_OR_LATER ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

#define SHWidth         (self.view.frame.size.width)
#define SHHeight        (self.view.frame.size.height)

#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#endif
