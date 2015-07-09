//
//  GraphView.h
//  store
//
//  Created by Mac02 on 15/5/29.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreStoreViewController.h"
#import "UUChart.h"

@interface GraphView : UIView<UIWebViewDelegate,UITextFieldDelegate,UUChartDataSource>
{
    UUChart *chartView;
}

@end
