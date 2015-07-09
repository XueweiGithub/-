//
//  BaseViewController.h
//  FirstProject
//
//  Created by mac on 14-8-8.
//  Copyright (c) 2014年 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceManager.h"
#import "YHSYHttpRequest.h"
#import "RefreshView.h"
#define GOBACK_IMAGE @"goBackImage.png"
#define EDIT_IMAGE @"editorImage.png"
#define BUTTONBACK_IMAGE @"buttonBackImage.png"
#define BUTTONBACK_IMAGE_S @"buttonBackImage2.png"
#define ADD_IMAGE @"addImage.png"


@interface BaseViewController : UIViewController<UIAlertViewDelegate>

{
    RefreshView *_refreshView;
    UILabel *_operationLabel;
}

//创建提示标签
- (UILabel *)createOperationResultLabelWithFrame:(CGRect)frame backGroundColor:(UIColor *)color text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font;
//添加导航左右按钮
- (void)addButtonItemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title frame:(CGRect)frame selector:(SEL)selector isLeft:(BOOL)isLeft;

//更改按钮按钮标题
- (void)changeButtonTitle:(NSString *)title titleColor:(UIColor *)color frame:(CGRect)frame isLeft:(BOOL)isLeft;

//创建刷新视图
- (void)createRefreshView;

- (void)createOperationResultLabel;

//添加返回按钮
- (void)addGoBackButton;

//返回
- (void)goBackButtonClick;

//设置日期格式 年月日+时分秒
- (void)setFormatterDateAndTime:(NSDateFormatter *)formatter;

//设置日期格式 年月日
- (void)setFormatterDate:(NSDateFormatter *)formatter;

- (BOOL)isNotNullInDictionary:(NSDictionary *)dic key:(NSString *)key;

@end
