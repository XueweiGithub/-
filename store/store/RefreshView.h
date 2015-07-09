//
//  RefreshView.h
//  LOL小助手
//
//  Created by qianfeng on 14-7-11.
//  Copyright (c) 2014年 FHB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshView : UIView

@property (nonatomic,strong) UIImageView *refreshImageView;

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
- (void)startRefresh;
- (void)stopRefresh;
- (void)animationDuration:(NSTimeInterval)time;
- (id)initNoBackViewWithFrame:(CGRect)frame;
@end
