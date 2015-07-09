//
//  MapAddress.h
//  tmpaa
//
//  Created by PK on 14-1-13.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MapAddress : NSObject
/*
 百度地图
 SystemConfiguration
 QuartzCore
 OpenGLES
 Security
 CFNetwork
 CoreLocation
 
 C39bf66953d70619681afd5dbe7c924c
 40.036024, 116.351886
 */

// 地址反编码...
+ (NSData *) getBaiduAddress:(CLLocation *)location;
+ (NSString *) getGoogleAddress:(CLLocation *)location;

@end
