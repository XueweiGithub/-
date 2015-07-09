//
//  BaseViewController.m
//  FirstProject
//
//  Created by mac on 14-8-8.
//  Copyright (c) 2014年 personal. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor whiteColor];
    if ([DeviceManager isIOS7Version]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationController.navigationBar.translucent = NO;
}

- (void)createOperationResultLabel{
    //已加载全部数据
    _operationLabel = [self createOperationResultLabelWithFrame:CGRectMake(100, [DeviceManager currentScreenHeight]-105, 120, 30) backGroundColor:[UIColor blackColor] text:@"已加载全部数据" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
}

- (BOOL)isNotNullInDictionary:(NSDictionary *)dic key:(NSString *)key{
    if (![[dic objectForKey:key] isEqual:[NSNull null]]) {
        return YES;
    }else{
        return NO;
    }
}

- (void)setFormatterDate:(NSDateFormatter *)formatter{
    [formatter setDateFormat:@"yyyy-MM-dd"];
}

- (void)setFormatterDateAndTime:(NSDateFormatter *)formatter{
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)createRefreshView{
    _refreshView = [[RefreshView alloc] initWithFrame:CGRectMake(0, 0, [DeviceManager currentScreenWidth], [DeviceManager currentScreenHeight])];
    [_refreshView animationDuration:0.8];
    _refreshView.hidden = YES;
    [[UIApplication sharedApplication].delegate.window addSubview:_refreshView];
}

//添加提示标签
- (UILabel *)createOperationResultLabelWithFrame:(CGRect)frame backGroundColor:(UIColor *)color text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = color;
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = font;
    label.hidden = YES;
    
    [self.view addSubview:label];
    return label;
}

//添加导航左右按钮
- (void)addButtonItemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title frame:(CGRect)frame selector:(SEL)selector isLeft:(BOOL)isLeft{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
}

//更改按钮按钮标题
- (void)changeButtonTitle:(NSString *)title titleColor:(UIColor *)color frame:(CGRect)frame isLeft:(BOOL)isLeft{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)addGoBackButton{
    [self addButtonItemWithImage:GOBACK_IMAGE selectedImage:nil title:nil frame:CGRectMake(0, 0, 25, 25) selector:@selector(goBackButtonClick) isLeft:YES];
}

- (void)goBackButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
