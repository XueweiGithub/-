//
//  RefreshView.m
//  LOL小助手
//
//  Created by qianfeng on 14-7-11.
//  Copyright (c) 2014年 FHB. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2-60, self.bounds.size.height/2-40-20, 120, 80)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.8;
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = YES;
        [self addSubview:view];
        _refreshImageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-20, view.frame.size.height/2-30, 40, 40)];
        _refreshImageView.image = [UIImage imageNamed:@"letv_pl_loading1.png"];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 1; i < 12; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"letv_pl_loading%d.png",i]];
            [array addObject:image];
        }
        _refreshImageView.animationImages = array;
        [view addSubview:_refreshImageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width/2-50, view.frame.size.height/2-20+20, 100, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"正在加载中。。。";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15.0f];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];

        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    self = [super initWithFrame:frame];
    if (self) {
        if (imageArray.count > 0) {
            self.backgroundColor = [UIColor blackColor];
            self.alpha = 0.5;
            NSString *imageString = [imageArray objectAtIndex:0];
            _refreshImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-20, self.frame.size.height/2-30, 40, 40)];
            _refreshImageView.image = [UIImage imageNamed:imageString];
            NSMutableArray *array = [[NSMutableArray alloc] init];
            for (int i = 0; i < imageArray.count; i++) {
                UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
                [array addObject:image];
            }
            _refreshImageView.animationImages = array;
        }
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-50, self.frame.size.height/2-20+20, 100, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"正在加载中。。。";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15.0f];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    
    return self;
}


- (id)initNoBackViewWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.8;
        _refreshImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-20, self.frame.size.height/2-30, 40, 40)];
        _refreshImageView.image = [UIImage imageNamed:@"letv_pl_loading1.png"];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 1; i < 12; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"letv_pl_loading%d.png",i]];
            [array addObject:image];
        }
        _refreshImageView.animationImages = array;
        [self addSubview:_refreshImageView];
    }
    
    return self;
}





- (void)startRefresh{
    [_refreshImageView startAnimating];
}

- (void)stopRefresh{
    [_refreshImageView stopAnimating];
}


- (void)animationDuration:(NSTimeInterval)time{
    _refreshImageView.animationDuration = time;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
