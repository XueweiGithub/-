//
//  DeviceManager.h
//  LOL小助手
//
//  Created by qianfeng on 14-7-6.
//  Copyright (c) 2014年 FHB. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface DeviceManager : NSObject

//当前版本对应的屏幕高度
+ (NSInteger)currentScreenHeight;

//当前版本对应的屏幕宽度
+ (NSInteger)currentScreenWidth;

//当前版本是否是iOS7以上
+ (BOOL)isIOS7Version;

+ (BOOL)isIOS8Version;

//当前设备的信息
+ (NSString *)currentDevice;


@end
