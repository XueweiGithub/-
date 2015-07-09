//
//  MKHttpRequest+ShopList.m
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "MKHttpRequest+ShopList.h"

@implementation MKHttpRequest (ShopList)

//商品侧滑信息接口
- (void)getFlankShopInfo:(NSString *)shop_type
                 shop_id:(NSString *)shop_id
               market_id:(NSString *)market_id
             category_id:(NSString *)category_id
            onCompletion:(RequestCompletionBlocks)onCompletion
                 onError:(RequestFailedBlocks)onError{
    //url ?之前拼装
    NSMutableString *contentJsonURL = [[NSMutableString alloc]initWithString:kWebSiteURL];
    [contentJsonURL appendFormat:kGetFlankShopInfo];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:shop_type forKey:@"shop_type"];
    [dict setObject:shop_id forKey:@"shop_id"];
    [dict setObject:market_id forKey:@"market_id"];
    
    //根据情况 看是否需要传递
    if (category_id.length >0) {
        [dict setObject:category_id forKey:@"category_id"];
    }
    //    DLog(@"dict:%@",dict);
    self.isShowError = YES;
    
    //get请求
    [self requestGet:contentJsonURL
              params:dict
        onCompletion:^(id result) {
            onCompletion(result);
        } onError:^(NSError *error) {
            onError(error);
        } onProgress:^(double progress) {
            
        }];
}



@end
