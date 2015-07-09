//
//  MKHttpRequest+ShopList.h
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "MKHttpRequest.h"

@interface MKHttpRequest (ShopList)

//商品侧滑信息接口
- (void)getFlankShopInfo:(NSString *)shop_type          //店铺类型，1为普通店铺，2为综合店铺
                 shop_id:(NSString *)shop_id
               market_id:(NSString *)market_id
             category_id:(NSString *)category_id        //类别ID
            onCompletion:(RequestCompletionBlocks)onCompletion
                 onError:(RequestFailedBlocks)onError;


@end
