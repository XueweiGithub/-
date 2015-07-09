//
//  MoreStoreViewController.h
//  store
//
//  Created by Mac02 on 15/5/28.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "ViewController.h"

@protocol MoreStoreDelegate <NSObject>


@end

@interface MoreStoreViewController : ViewController
{
    //UIButton *AnNiButton;
}
@property (nonatomic,strong) UIButton *_AnNiButton;

@property (nonatomic,assign) id<MoreStoreDelegate> delegate;
@end
