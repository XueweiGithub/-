//
//  AppDelegate.m
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "AppDelegate.h"
#import "StoreViewController.h"
#import "StoreView.h"
#import "MoreStoreViewController.h"
#import "GraphObject.h"
#import "GraphView.h"
#import "GlobalShare.h"

#import "GraViewController.h"

@interface AppDelegate ()

{
    NSMutableArray *tempArray;
    
    NSArray *DataArray;
}

@property (nonatomic,strong) GlobalShare *getShare;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    GraViewController *StoreViewVC = [[GraViewController alloc] init];
//    UINavigationController *NavVC= [[UINavigationController alloc] initWithRootViewController:StoreViewVC];
//    self.window.rootViewController = NavVC;
    
//    MoreStoreViewController *MoreVC = [[MoreStoreViewController alloc] init];
//    self.window.rootViewController = MoreVC;
    
    StoreViewController *StoreViewVC = [[StoreViewController alloc] init];
    UINavigationController *NavVC= [[UINavigationController alloc] initWithRootViewController:StoreViewVC];

    self.window.rootViewController = NavVC;
    
    //预先获得 数据
   // [[NSNotificationCenter defaultCenter]postNotificationName:kGetCategoryValue object:nil ];

    
   // [self GraphView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
    
    
}

-(void) GraphView {
    
    
    //第一步，创建URL
    
    NSString *strG = [NSString stringWithFormat:@"http://test.tianpingpai.com/api/prod/getSaleProdDetailInfo.json?id=1"];
    NSURL *url = [NSURL URLWithString:strG];
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
        
        DLog(@"%@",jsonObject);
        
        
        NSArray *history_prices = [[jsonObject valueForKey:@"result"]valueForKey:@"history_prices" ];
        DLog(@"history_prices:%@",history_prices);
        
        tempArray = [NSMutableArray array];
        
        
        for (NSDictionary *dict in history_prices) {
            DLog(@"dict:%@",dict);
            
            
            NSArray *array = dict[@"price_list"];
            
            // NSLog(@"arry:%lu",(unsigned long)array.count);
            
            
            for (NSDictionary *getDict in array) {
                GraphObject *graph = [[GraphObject alloc]init ];
                
                
                graph.date = getDict[@"date"];
                graph.price = getDict[@"price"];
                
                [tempArray addObject:graph.price];
                
                NSLog(@"tempArray:%@",tempArray);
            }
            
            self.getShare.systemInfo.SubArray = tempArray;
            
            NSLog(@"DataArray:%@",self.getShare.systemInfo.SubArray);
            
            //   [chartView strokeChart];
            
        }
        
        
    }];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
