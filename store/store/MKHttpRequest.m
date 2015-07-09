//
//  MKHttpRequest.m
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "MKHttpRequest.h"

@implementation MKHttpRequest

//post请求
- (void)requestPost:(NSString *)url                      //请求url
             params:(NSDictionary *)params               //参数
       onCompletion:(RequestCompletionBlocks)onCompletion
            onError:(RequestFailedBlocks)onError
         onProgress:(RequestProgress)onProgress{
    
    [self startRequestMethod:url
                      params:params
                 fieldParams:nil
               requestMethod:kPOST onCompletion:^(id result) {
                   onCompletion(result);
               } onError:^(NSError *error) {
                   onError(error);
               }];
}


////post请求 带data
//- (void)requestDataPost:(NSString *)url                      //请求url
//                 params:(NSDictionary *)params               //参数
//            fieldParams:(NSDictionary *)fieldParams          //图片参数
//           onCompletion:(RequestCompletionBlocks)onCompletion
//                onError:(RequestFailedBlocks)onError
//             onProgress:(RequestProgress)onProgress{
//    self.fileType = kDataType;
//    [self startRequestMethod:url
//                      params:params
//                 fieldParams:fieldParams
//               requestMethod:kPOST
//                onCompletion:^(id result) {
//                    onCompletion(result);
//                } onError:^(NSError *error) {
//                    onError(error);
//
//                } onProgress:^(double progress) {
//                    onProgress(progress);
//                }];
//}
//
////post请求 带file
//- (void)requestFilePost:(NSString *)url                  //请求url
//                 params:(NSDictionary *)params               //参数
//            fieldParams:(NSDictionary *)fieldParams          //图片参数
//           onCompletion:(RequestCompletionBlocks)onCompletion
//                onError:(RequestFailedBlocks)onError
//             onProgress:(RequestProgress)onProgress{
//
//    self.fileType = kFieldType;
//    [self startRequestMethod:url
//                      params:params
//                 fieldParams:fieldParams
//               requestMethod:kPOST
//                onCompletion:^(id result) {
//                    onCompletion(result);
//                } onError:^(NSError *error) {
//                    onError(error);
//
//                } onProgress:^(double progress) {
//                    onProgress(progress);
//                }];
//}

//get请求
- (void)requestGet:(NSString *)url                      //请求url
            params:(NSDictionary *)params               //参数
      onCompletion:(RequestCompletionBlocks)onCompletion
           onError:(RequestFailedBlocks)onError
        onProgress:(RequestProgress)onProgress{
    self.isShowError = YES;
    [self startRequestMethod:url
                      params:params
                 fieldParams:nil
               requestMethod:kGET
                onCompletion:^(id result) {
                    onCompletion(result);
                } onError:^(NSError *error) {
                    onError(error);
                }];
}


@end
