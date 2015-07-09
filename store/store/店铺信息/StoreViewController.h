//
//  StoreViewController.h
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreView.h"
//#import "MoreStoreView.h"
#import <AssetsLibrary/AssetsLibrary.h>


@protocol storeViewDelegate <NSObject>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;


@end


@interface StoreViewController : UIViewController <UIScrollViewDelegate,UIImagePickerControllerDelegate,NSURLConnectionDataDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
{

    UIScrollView *ScrollView;
    
    UIDatePicker *_datePicker;
}

@property (nonatomic,strong) StoreView *StoreView;

@property (nonatomic,assign) id<storeViewDelegate> delegate;

@property (nonatomic,strong) UIButton *HeadImageBtn;
@end

