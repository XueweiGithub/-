//
//  YHSYHttpRequest.h
//  FirstProject
//
//  Created by mac on 14-8-15.
//  Copyright (c) 2014年 personal. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^RequestFinished)(NSData *data);
typedef void(^RequestFailed)(NSString *errorMessage);

@interface YHSYHttpRequest : NSObject<NSURLConnectionDataDelegate>

{
    RequestFinished _finished;
    RequestFailed _failed;
}

//post请求
- (id)postConnectionWithHead:(NSString *)head parmDic:(NSDictionary *)parmDic finishedBlock:(RequestFinished)finishedBlock failedBlock:(RequestFailed)failedBlock;

//get请求
- (id)getConnectionWithUrl:(NSString *)url finishedBlock:(RequestFinished)finishedBlock failedBlock:(RequestFailed)failedBlock;


@end
