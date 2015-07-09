//
//  MKHttpRequest.h
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "AFNetRequest.h"

@interface MKHttpRequest : AFNetRequest

//post请求
- (void)requestPost:(NSString *)url                      //请求url
             params:(NSDictionary *)params               //参数
       onCompletion:(RequestCompletionBlocks)onCompletion
            onError:(RequestFailedBlocks)onError
         onProgress:(RequestProgress)onProgress;


////post请求 带data
//- (void)requestDataPost:(NSString *)url                     //请求url
//                 params:(NSDictionary *)params               //参数
//            fieldParams:(NSDictionary *)fieldParams          //图片参数
//           onCompletion:(RequestCompletionBlocks)onCompletion
//                onError:(RequestFailedBlocks)onError
//             onProgress:(RequestProgress)onProgress;
//
////post请求 带file
//- (void)requestFilePost:(NSString *)url                  //请求url
//                 params:(NSDictionary *)params               //参数
//            fieldParams:(NSDictionary *)fieldParams          //图片参数
//           onCompletion:(RequestCompletionBlocks)onCompletion
//                onError:(RequestFailedBlocks)onError
//             onProgress:(RequestProgress)onProgress;


//get请求
- (void)requestGet:(NSString *)url                      //请求url
            params:(NSDictionary *)params               //参数
      onCompletion:(RequestCompletionBlocks)onCompletion
           onError:(RequestFailedBlocks)onError
        onProgress:(RequestProgress)onProgress;


@end
