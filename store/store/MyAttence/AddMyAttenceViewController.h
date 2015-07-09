//
//  AddMyAttenceViewController.h
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "BMapKit.h"

@protocol AddMyAttenceViewControllerDelegate <NSObject>

- (void)refreshView;

@end

@interface AddMyAttenceViewController : BaseViewController<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,UIAlertViewDelegate>

{
    BMKLocationService *_locationService;
    BMKGeoCodeSearch *_searcher;
    //BMKMapManager *_mapManager;
}

@property (nonatomic,copy) NSString *startDate;
@property (nonatomic,copy) NSString *endDate;
@property (nonatomic,copy) NSString *userID;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,weak) id<AddMyAttenceViewControllerDelegate>delegate;

@end
