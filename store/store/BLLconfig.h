//
//  BLLconfig.h
//  store
//
//  Created by Mac02 on 15/6/5.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#ifndef store_BLLconfig_h
#define store_BLLconfig_h

//http常用四种方法
#define kGET                @"GET"
#define kPUT                @"PUT"
#define kPOST               @"POST"
#define kDELETE             @"DELETE"


//http文件上传类型
#define kDataType           @"DataType"
#define kFieldType          @"FieldType"

//测试地址
#define kWebSiteURL @"http://test.tianpingpai.com/"


//正式服务器
//#define kWebSiteURL @"http://api.tianpingpai.com/"



/**
 * @brief 网络请求参数
 */
#pragma mark-
#pragma mark Request Methods-
//请求参数


//*******************************1.0接口****************************************

#define kVersionCheck       @"api/version/getVersion.json"                          //检测版本号

//---------------用户接口---------------
#define kUserLogin           @"api/user/login.json"                                 //登录接口
#define kRegister            @"api/user/register.json"                              //注册接口
#define kUserLogin           @"api/user/login.json"                                 //登录接口
#define kVerifyCode          @"api/verify/sendVerifyCode.json"                      //验证接口
#define kResetPassWord       @"api/user/resetPwd.json"                              //重置密码
#define kUpdatePassWord      @"api/user/updatePwd.json"                             //修改用户密码
#define kUpdateDisplayname   @"api/user/updateBuyUserInfo.json"                     //修改用户信息
#define kGetTradeInfo        @"api/user/getTradeList.json"                          //获取用户交易信息
#define kPushUser            @"api/user/registTerminal.json"                        //推送用户
#define kGetOrderCount       @"api/user/getOrderCounts.json"                        //订单数


#define kUserCollectShop     @"api/favorite/getBuyFavoriteListInfo.json"            //用户收藏店铺
#define kUserAddShop         @"api/favorite/addFavoriteSaler.json"                  //用户增加店铺
#define kUserDelShop         @"api/favorite/delFavoriteSaler.json"                  //用户删除店铺

//---------------公共接口---------------
#define kGetServerAddress    @"api/area/getAreaDataList.json"                       //预先得到服务器返回的地址
#define kGetCategoryList     @"api/category/getCategoryDataList.json"               //获取商品一二级全部分类信息接口
#define kGetClassification   @"api/category/getProdFirstDataList.json"              //获取分类信息


#define kGetUserInfo         @"api/user/getBuyUserDetailInfo.json"                  //获取某一买家用户信息
#define kUpdataUserInfo      @"api/user/updateBuyerUserInfo.json"                   //修改买家用户信息
#define kSelectBusiness      @"api/market/list"

//---------------地址接口---------------
#define kAddUserAddr         @"api/user/addUserAddr.json"                            //添加买家用户收货地址
#define kUpdataUserAddr      @"api/user/updateUserAddr.json"                         //修改买家用户收货地址
#define kDelUserAddr         @"api/user/delUserAddr.json"                            //删除买家用户收货地址
#define kGetArea             @"api/area/getAreaDataList.json"                        //地区接口

//---------------订单接口---------------
#define kGetOrderInfo        @"api/order/getOrderListInfo.json"                      //查询订单
#define kOrderDetailInfo     @"api/order/getOrderDetailInfo.json"                    //查询某一订单接口
#define kTraceOrderInfo      @"api/order/getOrderTraceInfo.json"                     //获取某一订单轨迹
#define kAddOrder            @"api/order/addOrder.json"                              //增加订单
#define kcancleOrder         @"api/order/delOrder.json"                              //取消订单
#define kUpdataOrderState    @"api/order/updateOrderStatus.json"                     //修改订单状态
#define kPayAlipay           @"pay/wap/alipay"                                       //订单 支付宝支付

//---------------评论接口----------------
#define kAddComment          @"api/comment/add"                                      //提交评论
#define kGetCommentList      @"api/comment/list"                                     //查看评论
#define kGetCommentNum       @"api/comment/statistic"                                //获取评论数量


//---------------一键下单接口---------------
#define kCategoryListInfo       @"api/fastorder/getSaleCategoryListInfo.json"        //获取用户一键下单商品分类接口
#define kCategoryOrder          @"api/fastorder/fastOrder.json"                      //一键下单接口
#define kGenerateShoppingCart   @"api/shopping/generateShopCart.json"                //生成购物车接口


//---------------订菜商铺接口---------------
#define kSaleListInfo       @"api/user/getRecommendSaler.json"                      //根据食材分类获取卖家用户列表接口
#define kSearchProdList     @"api/search/searchProd.json"                           //搜索菜品接口
#define kSellerShopList     @"api/prod/getSaleProdListInfo.json"                    //查询卖家商品信息接口
#define kUserShopList       @"api/prod/commonuse.json"                              //该店铺买家常用列表
#define kUserAddShopList    @"api/prod/addCommonuse.json"                           //该店铺买家增加常用列表
#define kUserDelShopList    @"api/prod/delCommonuse.json"                           //该店铺买家删除常用列表

#define kGetProductInfo     @"api/prod/getSaleProdDetailInfo.json"                  //某一商品详情
#define kShopListInfo       @"api/prod/getSaleUserProdListInfo.json"                //店铺信息 一次性返回


//---------------统计接口-------------------
#define kGetBuyerStatistics      @"api/statistics/getBuyerStatistics.json"  //买家统计


//---------------消息接口-------------------
#define kGetMessageInfo     @"api/msg/getMsgInfo.json"                              //消息接口


//---------------首页接口-------------------
#define kGetIndexInfo     @"api/dashboard/main"                                     //获取APP首页信息






/******************************1.10版本 ****************************************/
#define kMultiProdListInfo      @"api/shop/getMultiProdListInfo.json"               //查询综合店铺商品信息接口

#define kCollectMultiShopInfo   @"api/shop/getMultiShopInfo.json"                   //收藏进入综合店铺
#define kAddCommonuse           @"api/prod/addCommonuse.json"                       //增加店铺常用清单

/******************************1.21版本 ****************************************/

#define kFavoriteCollectShop    @"api/favorite/getShopIsFavorite.json"              //判断当前店铺是否收藏过
#define kGetFlankShopInfo       @"api/shopinfo/getShopInfo.json"                    //侧滑 商品侧滑信息接口

/******************************1.22版本 ****************************************/
#define kActivityDetail         @"api/activity/get"                                 //获取活动详情
#define kActivitySign           @"api/activity/join"                                //活动报名接口


//临时纪录
//#define kShopListInfoData                 @"ShopListInfo"         //商铺数组




#pragma mark-
#pragma mark UserInfo Methods-



#define kBusinessInfo                     @"BusinessInfo"                         //商圈





#define kSaveUserInfo                 @"saveUserInfo"                           //用户存储信息
#define kSystemInfo                   @"systemInfo"                             //系统信息
#define kShoppingInfo                 @"ShoppingInfo"                           //购物车信息

#define kPrefabricateDictInfo         @"PrefabricateDictInfo"                   //预制购物车信息字典
#define kVersionDictInfo              @"VersionDictInfo"                        //版本信息



#endif
