//
//  YHSYHttpRequest.m
//  FirstProject
//
//  Created by mac on 14-8-15.
//  Copyright (c) 2014年 personal. All rights reserved.
//

#import "YHSYHttpRequest.h"

@implementation YHSYHttpRequest

{
    NSURLConnection *_urlConnection;
    NSMutableData *_downloadData;
}

//post请求
- (id)postConnectionWithHead:(NSString *)head parmDic:(NSDictionary *)parmDic finishedBlock:(RequestFinished)finishedBlock failedBlock:(RequestFailed)failedBlock{
    if (self == [super init]) {
        _downloadData = [[NSMutableData alloc] init];
        if (_finished != finishedBlock) {
            Block_release(_finished);
            _finished = Block_copy(finishedBlock);
        }
        if (_failed != failedBlock) {
            Block_release(_failed);
            _failed = Block_copy(failedBlock);
        }
    }
    
    NSURL *url = [NSURL URLWithString:head];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSMutableString *bodyString = [NSMutableString string];
    int i = 0;
    for (NSString *key in parmDic) {
        id obj = [parmDic objectForKey:key];
        if (i == 0) {
            [bodyString appendFormat:@"%@=%@",key,obj];
        }else{
            [bodyString appendFormat:@"&%@=%@",key,obj];
        }
        i++;
    }
    NSLog(@"bodyString = %@",bodyString);
    //将字符串参数转换成NSData
    NSData *data = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    //获取data的长度
    NSString *dataLength = [NSString stringWithFormat:@"%u",data.length];
    //将参数的长度作为http post请求的请求头信息
    [request addValue:dataLength forHTTPHeaderField:@"Content-Length"];
    
    ////////////////////////////////////////////////请求头
    [request setHTTPBody:data];
    //将参数作为请求体
    _urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    return self;
    
}


//get请求
- (id)getConnectionWithUrl:(NSString *)url finishedBlock:(RequestFinished)finishedBlock failedBlock:(RequestFailed)failedBlock{
    if (self == [super init]) {
        _downloadData = [[NSMutableData alloc] init];
        if (_finished != finishedBlock) {
            Block_release(_finished);
            _finished = Block_copy(finishedBlock);
        }
        if (_failed != failedBlock) {
            Block_release(_failed);
            _failed = Block_copy(failedBlock);
        }
    }
    
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //发送
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    return self;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [_downloadData setLength:0];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_downloadData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"请求成功！");
    if (_downloadData == nil||_downloadData.length == 0) {
        _failed(@"数据为空");
    }else{
        _finished(_downloadData);
    }
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求失败！");
    _failed(error.localizedDescription);
}


@end
