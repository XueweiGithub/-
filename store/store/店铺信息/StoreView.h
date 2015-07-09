//
//  StoreView.h
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface StoreView : UIView <UIScrollViewDelegate>

{
    @private
    CustomVerticalLabel *marketName;
    
    UITextView *Content;
    
    CustomVerticalLabel *BriefContent;  //餐厅简介
    
    CustomVerticalLabel *DiningAddress; //餐厅地址
    
    CustomVerticalLabel *DiningData;    //营业时间
    
    CustomVerticalLabel *license;       //许可证
    CustomVerticalLabel *permit;        //营业执照
    
    CustomVerticalLabel *Uptoprice;     //起送价
    
    CustomVerticalLabel *distprice;     //配送价格
    
    CustomVerticalLabel *averagepoin;   //平均分
    
    CustomVerticalLabel *commentspoin;  //评论分
    CustomVerticalLabel *peoplenum;     //评论人数
    CustomVerticalLabel *category;       //货品
    
    UIScrollView *_ScrollView;
    
    UITableView *DataTable;
}



//@property (nonatomic,strong) UIScrollView *ScrollView;

@property (nonatomic,strong) UIImageView *HeadImage;  //头像图片

@property (nonatomic,strong) UIButton *HeadImageBtn;

@end

