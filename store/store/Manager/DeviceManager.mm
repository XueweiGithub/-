//
//  DeviceManager.m
//  LOL小助手
//
//  Created by qianfeng on 14-7-6.
//  Copyright (c) 2014年 FHB. All rights reserved.
//

#import "DeviceManager.h"

@implementation DeviceManager

+ (NSInteger)currentScreenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (NSInteger)currentScreenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (BOOL)isIOS7Version{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if ([version floatValue] >= 7.0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isIOS8Version{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if ([version floatValue] >= 8.0) {
        return YES;
    }
    return NO;
}


+ (NSString *)currentDevice{
    return [UIDevice currentDevice].model;
}

@end
