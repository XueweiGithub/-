//
//  MapAddress.m
//  tmpaa
//
//  Created by PK on 14-1-13.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import "MapAddress.h"

@implementation MapAddress


// 地址反编码...
+ (NSData *) getBaiduAddress:(CLLocation *)location {
    // 通过baidu取得这个位置的经纬度
    double latitude = location.coordinate.latitude;
    double longtitude = location.coordinate.longitude;
    NSString *urlstr = [NSString stringWithFormat:
                        @"http://api.map.baidu.com/geocoder?output=json&location=%f,%f&key=LElkS0PLGulVupKMqDVnXiaO",
                        latitude, longtitude];
    NSURL *url = [NSURL URLWithString:urlstr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}
+ (NSString *) getGoogleAddress:(CLLocation *)location {
    NSString *urlstr = [NSString stringWithFormat:
                        @"http://maps.google.com/maps/api/geocode/json?latlng=%f,%f&language=zh-CN&sensor=false",
                        location.coordinate.latitude, location.coordinate.longitude];
    NSLog(@"%@", urlstr);
    // http://maps.google.com/maps/api/geocode/json?latlng=40.029159,116.346974&language=zh-CN&sensor=false
    NSURL *url = [NSURL URLWithString:urlstr];
    NSString *s = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    return s;
}

@end
