//
//  customDefs.h
//  SmartHome
//
//  Created by banwang on 16/1/28.
//  Copyright © 2016年 huajun. All rights reserved.
//

#ifndef customDefs_h
#define customDefs_h
/*
 0 操作成功
 100 未登陆，有两种情况，一种是确实没有登陆，二是上次登陆的session过期(2小时)，两种情况都需要重新发送登陆命令
 101 登陆失败，用户名/密码错误
 102 注册失败，邮箱已被注册
 103 注册失败，手机号已被注册
 104 未找到相应设备，如请求操作不属于当前用户的设备等
 105 注册失败，用户名不能为空
 106 注册失败，密码不能为空
 107 注册失败，验证码为空
 109 重置密码失败，参数错误
 110 重置密码失败，用户未注册
 120 申请验证码失败，缺少参数
 121 申请验证码失败，网络错误
 122 申请验证码失败，距上次申请验证码时间间隔小于120秒，申请过于频繁
 123 验证码错误
 124 验证码过期
 130 上传头像失败
 131 下载头像失败，该用户未上传头像
 200 操作设备失败，无法访问中控机或者中控机操作设备失败
 201 缺少参数
 202 参数格式错误
 301 添加设备失败，该设备已经被添加
 302 添加设备失败，该用户已经有相同名称的设备
 401 创建情景模式失败，该用户已经有相同名称的情景模式
 */
typedef NS_ENUM(NSInteger, SHErrorType){
    //未登陆
    SHError_invalidlogin = 100,
    //登陆失败
    SHError_loginfail,
    //注册失败,邮箱已被注册
    SHError_registerdemail,
    //注册失败，手机号已被注册
    SHError_registerdphone,
};

//{
//    {
//        put("灯",            new DeviceProperty(false, DEVICE_LIGHT));
//        put("插座",           new DeviceProperty(false, DEVICE_SOCKET));
//        put("机顶盒",        new DeviceProperty(true, DEVICE_STB));
//        put("电视",          new DeviceProperty(true, DEVICE_TV));
//        put("空调",          new DeviceProperty(true, DEVICE_AC));
//        put("摄像头",        new DeviceProperty(false, DEVICE_CAMERA));
//        put("门铃对讲",      new DeviceProperty(false, DEVICE_TALKBACK));
//        put("窗帘",          new DeviceProperty(false, DEVICE_CURTAIN));
//        put("窗户",          new DeviceProperty(false, DEVICE_WINDOW));
//        put("地暖",          new DeviceProperty(false, DEVICE_FH));
//        put("DVD",          new DeviceProperty(true, DEVICE_DVD));
//        put("投影",          new DeviceProperty(false, DEVICE_PROJECTOR));
//        put("幕布",          new DeviceProperty(false, DEVICE_SCREEN));
//        put("温控",          new DeviceProperty(false, DEVICE_TC));
//        put("一氧化碳传感器",  new DeviceProperty(false, DEVICE_CM));
//        put("二氧化碳传感器",  new DeviceProperty(false, DEVICE_CD));
//        put("新风",           new DeviceProperty(false, DEVICE_NT));
//        put("紧急按钮",       new DeviceProperty(false, DEVICE_EMERGENCY));
//        put("冰箱",           new DeviceProperty(false, DEVICE_FREEZER));
//        put("音乐",           new DeviceProperty(false, DEVICE_MUSIC));
//    }
//};

#endif /* customDefs_h */
