//
//  GraViewController.h
//  store
//
//  Created by Mac02 on 15/6/12.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUChart.h"

@interface GraViewController : UIViewController<UUChartDataSource>

{
    UUChart *chartView;
}

@end
