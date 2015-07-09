//
//  AFNetRequest.h
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BLLConfig.h"
#import "AFNetRequest.h"
#import "AFHTTPRequestOperationManager.h"
typedef void (^RequestCompletionBlocks)(id result);
typedef void (^RequestFailedBlocks)(NSError *error);
typedef void (^RequestProgress)(double progress);


@interface AFNetRequest : NSObject

@property (nonatomic,strong) NSString * fileType;
@property (nonatomic) BOOL isSafety;
@property (nonatomic) BOOL isShowError;                 //失败时 展示信息


//异步请求方式
- (void)startRequestMethod:(NSString *)url                      //请求url
                    params:(NSDictionary *)params               //参数
               fieldParams:(NSDictionary *)fieldParams          //文件参数
             requestMethod:(NSString *)method                   //请求方法
              onCompletion:(RequestCompletionBlocks)onCompletion
                   onError:(RequestFailedBlocks)onError;
//取消当前请求
- (void)cancelRequest;


@end
