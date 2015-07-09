//
//  GlobalShare.h
//  Project
//
//  Created by sike on 13-7-30.
//  Copyright (c) 2013年 sike. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GlobalShare;
@class User;
@class SystemInfo;

@interface GlobalShare : NSObject


+ (GlobalShare*)getGlobalShare;


@property (nonatomic,strong) User *user;
@property (nonatomic,strong) SystemInfo *systemInfo;
@property (nonatomic,strong) NSMutableDictionary *shoppingDict;   //购物车数组

- (void)clearUserInfo;  //清理用户信息


@end



@interface User : NSObject<NSCoding>
@property (nonatomic,strong) NSString *userPhone;       //用户手机
@property (nonatomic,strong) NSString *userPassWord;    //用户密码
@property (nonatomic,strong) NSString *userId;          //用户ID
@property (nonatomic,strong) NSString *departmentId;    //部门ID
@property (nonatomic,strong) NSString *marketerId;      //ID
@property (nonatomic,strong) NSString *parent_id;       
@property (nonatomic,strong) NSString *userNickName;    //用户昵称
@property (nonatomic,strong) NSString *position;        //职位
@property (nonatomic,strong) NSString *accessToken;     //token

@end

@interface SystemInfo : NSObject<NSCoding>

@property (nonatomic,strong) NSMutableArray *businessAry;   //地址数组
@property (nonatomic,strong) NSMutableArray *visitAry;     //进度数组
@property (nonatomic,strong) NSMutableArray *LevelAry;     //等级数组

@property (nonatomic,strong) NSString *isLogin;             //是否已经登陆
@property (nonatomic,strong) NSString *isFirst;             //是否第一次启动

@property (nonatomic,strong) NSMutableArray *subMarkerAry;  //我的下属
@property (nonatomic,strong) NSDictionary *marketDic;     //部门信息

@property (nonatomic,strong) NSDictionary *LevelDic;  // 等级
@property (nonatomic,strong) NSDictionary *VisitDic;  // 进度

@property (nonatomic,strong) NSMutableArray *SubArray;


@end


