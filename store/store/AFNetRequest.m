//
//  AFNetRequest.m
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "AFNetRequest.h"
#import "GlobalShare.h"
#import "NSString+extension.h"
#import "Utils.h"

@interface AFNetRequest(){
    AFHTTPRequestOperationManager * manager;
}
@end


@implementation AFNetRequest


//取消当前请求
- (void)cancelRequest{
    [[manager operationQueue]cancelAllOperations];  //取消请求
}

//异步请求方式
- (void)startRequestMethod:(NSString *)url                      //请求url
                    params:(NSDictionary *)params               //参数
               fieldParams:(NSDictionary *)fieldParams          //文件参数
             requestMethod:(NSString *)method                   //请求方法
              onCompletion:(RequestCompletionBlocks)onCompletion
                   onError:(RequestFailedBlocks)onError{
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES; //状态栏 网络图标开启
    manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval  = 10;  //超时时间 10秒钟
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"content-type:text/html",@"text/json", @"text/javascript" ,@"text/plain", nil];
    
    __block typeof(self)bself = self;  //防止在block中用到self时把self对象retain， 造成内存泄露。
    
    if (!self.isSafety) {   //默认为 都需要验证
        //增加公用参数
        params =[self publicParams:params];
        
    }
    //    DLog(@"params:%@",params);
    
    if ([method isEqualToString:kPOST]) {
        
        
        [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            if ([bself.fileType isEqualToString:kDataType]) {
                //对于Data的post请求
                for (NSString *key in [fieldParams keyEnumerator])
                {
                    [formData appendPartWithFormData:[fieldParams valueForKey:key] name:key];
                }
            }else if([bself.fileType isEqualToString:kFieldType]){
                //对于文件的post请求
                for (NSString *key in [fieldParams keyEnumerator])
                {
                    [formData appendPartWithFileURL:[fieldParams valueForKey:key] name:key error:nil];
                }
            }
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //状态栏 网络图标关闭
            NSError *error = nil;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:[[operation responseString] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
            
            //            DLog(@"--%@",jsonObject);
            
            if ([jsonObject isKindOfClass:[NSDictionary class]]){
                
                NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
                onCompletion(deserializedDictionary);
            } else if ([jsonObject isKindOfClass:[NSArray class]]){
                NSArray *deserializedArray = (NSArray *)jsonObject;
                onCompletion(deserializedArray);
            } else {
                NSLog(@"An error happened while deserializing the JSON data.");
                
            }
            
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"error :%@",[error localizedDescription]);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //状态栏 网络图标关闭
            
            if (!bself.isShowError) {
                [Utils alertWithTitle:@"" message:@"当前网络无法访问 请稍候再试!"];
            }
            onError(error);
        }];
    }else if([method isEqualToString:kGET]){
        [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //状态栏 网络图标关闭
            NSError *error = nil;
            //             DLog(@"responseString:%@",[operation responseString]);
            id jsonObject = [NSJSONSerialization JSONObjectWithData:[[operation responseString] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
            if ([jsonObject isKindOfClass:[NSDictionary class]]){
                
                NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
                onCompletion(deserializedDictionary);
            } else if ([jsonObject isKindOfClass:[NSArray class]]){
                NSArray *deserializedArray = (NSArray *)jsonObject;
                onCompletion(deserializedArray);
            } else {
                NSLog(@"An error happened while deserializing the JSON data.");
                
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            DLog(@"error :%@  code :%ld",[error localizedDescription],(long)error.code);
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //状态栏 网络图标关闭
            
            if (!bself.isShowError) {
                [Utils alertWithTitle:@"" message:@"当前网络无法访问 请稍候再试!"];
            }
            
            onError(error);
        }];
    }
    
}


//增加公用参数
- (NSDictionary *)publicParams:(NSDictionary *)dict{
    
    GlobalShare *getShare = [GlobalShare getGlobalShare];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithDictionary:dict];
    [params setObject:getShare.user.accessToken.length>0?getShare.user.accessToken:@"" forKey:@"accessToken"];
    [params setValue:@"v1.2.3" forKey:@"version"];
    [params setValue:@"0" forKey:@"update"];  //不强制更新
    return params;
}


@end
