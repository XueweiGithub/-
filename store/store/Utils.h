//
//  Utils.h
//  Men-iPad
//
//  Created by 苏孝禹 on 11/24/11.
//  Copyright 2011 Yunhe Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
//#import "ShoppingProdModel.h"

@interface Utils : NSObject

#pragma mark save / restore map state
+(NSString *)applicationDocumentsDirectory:(NSString *)filename;
+(NSString *)applicationCachesDirectory:(NSString *)filename;

#pragma mark -
#pragma mark Bookmark load ans save
+(void)saveData:(id)dataToSave to:(NSString *)filename;
+(id)loadDataFrom:(NSString *)filename;
+(void)removeData:(NSString *)filename;
+(void)alertWithTitle:(NSString *)title message:(NSString *)message;

+ (NSString *)getIPAddress;

+ (BOOL)validateEmail:(NSString *)emailAddress;  //验证邮箱
+ (BOOL)validatePhone:(NSString *)phoneNumber;   //验证手机号码
+ (BOOL)validatePassword:(NSString *)password;   //验证密码是否 包含数字和英文字母

+ (NSString *)getCurrentDate;



//yes 到正序 no为倒叙
+ (NSArray *)sortArray:(NSArray *)dataArray withKey:(NSString *)key ascending:(BOOL)ascending;



+(void)clearDiskData;  //清空硬盘所有存储数据


//获得ios系统版本号
+ (float)getIOSVersion;

//获取UUID
+ (NSString*) uuid;

#pragma mark - 算高
/*
 *返回label的高度
 */
+ (float)getLabelHeight:(NSString *)textString
            defautWidth:(float)defautWidth
           defautHeight:(float)defautHeight
               fontSize:(int)fontSize;


//处理字符串
+ (NSString *)disposalKey:(NSString *)key dict:(NSDictionary *)dict;

//拼装字符串
+(NSString *)combinationUrl:(NSString *)imgUrl imgSize: (NSString *)imgSize;

//首页拼接字符串
+(NSString *)indexCombinationUrl:(NSString *)imgUrl imgSize:(NSString *)imgSize;

@end
