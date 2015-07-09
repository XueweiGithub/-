//
//  StoreView.m
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "StoreView.h"

@implementation StoreView
{
    CGFloat _userContentOffsetX;
    BOOL _isLeftScroll;                             //是否左滑动

}

#define distanceX 10


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        _ScrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(kBaseOriginX+8, kBaseOriginY, kBaseWidth-16, kBaseHeight+65)];
        _ScrollView.backgroundColor = [UIColor clearColor];
        _ScrollView.userInteractionEnabled = YES;
        _ScrollView.delegate = self;
        _ScrollView.directionalLockEnabled = YES;
        _userContentOffsetX = 0;
        [self addSubview:_ScrollView];
        
        //头部view
        UIImageView *HeadView = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, _ScrollView.top, kBaseHeight-16, 130)];
        HeadView.backgroundColor = RGB(255, 255, 255);
        HeadView.userInteractionEnabled = YES;
        [_ScrollView addSubview:HeadView];
        
        //头像
        self.HeadImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+12, 12, 45, 45)];
        self.HeadImage.backgroundColor = [UIColor grayColor];
        self.HeadImage.userInteractionEnabled = YES;
       // [HeadView addSubview:self.HeadImage];
        
        _HeadImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, _HeadImage.size.width, _HeadImage.size.height)];
        [_HeadImageBtn addTarget:self action:@selector(OnclicHeadBtn) forControlEvents:UIControlEventTouchUpInside];
        _HeadImageBtn.backgroundColor = [UIColor clearColor];
        [self.HeadImage addSubview:_HeadImageBtn];
        
        //细线
        UIImageView *HeadLine = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, 65
                                                                              , kBaseWidth-16, 1)];
        HeadLine.backgroundColor = RGB(204, 204, 204);
        [HeadView addSubview:HeadLine];

        
        marketName = [CustomVerticalLabel createLabel:CGRectMake(self.HeadImage.right + 10, _HeadImage.top-10, 200, 40) text:@"土豪峰海鲜批发市场" textSize:15.0f];
        marketName.textColor = RGB(51, 51, 51);
        [HeadView addSubview:marketName];
        
        for (int i = 0; i <5 ; i++) {
        //星星图片
        UIImage *stars = [UIImage imageNamed:@"yellow_star@2x.png"];
        UIImageView *starsImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.HeadImage.right+10 + i*15, HeadView.top+35, stars.size.width, stars.size.height)];
        starsImage.image = stars;
        [HeadView addSubview:starsImage];
        }
        //评论人数
        peoplenum = [CustomVerticalLabel createLabel:CGRectMake(self.HeadImage.right+93, HeadView.top + 23, 100, 40) text:@"(188)" textSize:11.0f];
        peoplenum.textColor = RGB(153, 153, 153);
        [HeadView addSubview:peoplenum];
        
        //品类
        category = [CustomVerticalLabel createLabel:CGRectMake(self.HeadImage.right+125, HeadView.top+23, 100, 40) text:@"中式,奶茶" textSize:11];
        category.textColor = RGB(153, 153, 153);
        [HeadView addSubview:category];
        
        NSArray *Array = @[@"平均送货速度",@"人评论",@"平均送货速度"];
        
        for (int i = 0; i < Array.count; i++ ) {
            CustomVerticalLabel *scoreLabel = [CustomVerticalLabel createLabel:CGRectMake(15+i*100, HeadLine.bottom+27, 100, 40) text:[NSString stringWithFormat:@"%@",Array[i]] textSize:13.0f];
            scoreLabel.textColor = RGB(153, 153, 153);
            [HeadView addSubview:scoreLabel];
            
            CustomVerticalLabel *scoreLabelFen = [CustomVerticalLabel createLabel:CGRectMake(60+i*99, HeadLine.bottom+5, 100, 40) text:@"分" textSize:13.0f];
            scoreLabelFen.textColor = RGB(153, 153, 153);
            [HeadView addSubview:scoreLabelFen];
            if (i == 1) {
                scoreLabel.frame = CGRectMake(80+60, HeadLine.bottom+27, 100, 40);
            }
        }
        for (int T = 0; T < 2; T++) {
            UIImageView *HeadLineH = [[UIImageView alloc] initWithFrame:CGRectMake(100+T*96, HeadLine.bottom+20, 1, 25)];
            HeadLineH.backgroundColor = RGB(204, 204, 204);
            [HeadView addSubview:HeadLineH];
            
        }
        
        
        //平均分
        averagepoin = [CustomVerticalLabel createLabel:CGRectMake(36,HeadLine.bottom+3, 100, 40) text:@"34" textSize:21.0f];
        averagepoin.textColor = RGB(102, 102, 102);
        [HeadView addSubview:averagepoin];
        
        averagepoin = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth -85,HeadLine.bottom+3, 100, 40) text:@"34" textSize:21.0f];
        averagepoin.textColor = RGB(102, 102, 102);
        [HeadView addSubview:averagepoin];
        
        //评论分
        commentspoin = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth-193, HeadLine.bottom+3, 100, 40) text:@"4.6" textSize:21.0f];
        commentspoin.textColor = RGB(253, 114, 31);
        [HeadView addSubview:commentspoin];
        
        //评论人数
        peoplenum = [CustomVerticalLabel createLabel:CGRectMake(117, HeadLine.bottom+27, 100, 40) text:@"188" textSize:13.0f];
        peoplenum.textColor = RGB(253, 114, 31);
        [HeadView addSubview:peoplenum];
        
        //第二个视图
        UIImageView *sendview = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, HeadView.bottom+8, kBaseHeight-16, 38)];
        sendview.backgroundColor = RGB(255, 255, 255);
        [_ScrollView addSubview:sendview];
        
        //细线
        UIImageView *Imageline = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseWidth/2-7,8, 1, 21)];
        Imageline.backgroundColor = RGB(204, 204, 204);
        [sendview addSubview:Imageline];
        
        NSArray *monyArray = @[@"起送价",@"配送费"];
        for (int m = 0; m  < monyArray.count ; m++) {
            CustomVerticalLabel *MonyLabel = [CustomVerticalLabel createLabel:CGRectMake(distanceX+m*150, -2, 100, 40) text:[NSString stringWithFormat:@"%@",monyArray[m]] textSize:13.0f];
            MonyLabel.textColor = RGB(153, 153, 153);
            [sendview addSubview:MonyLabel];
        }
        //起送价
        Uptoprice = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth-210, -2, 100, 40) text:@"30元" textSize:12.0f];
        Uptoprice.textColor = RGB(102, 102, 102);
        [sendview addSubview:Uptoprice];
        
        //配送费
        distprice = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth-55, -2, 100, 40) text:@"20元" textSize:12.0f];
        distprice.textColor = RGB(102, 102, 102);
        [sendview addSubview:distprice];
    
        //公告视图
        UIImageView *Imagestree = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, sendview.bottom+8, kBaseWidth-16, 100)];
        Imagestree.backgroundColor = RGB(255, 255, 255);
        Imagestree.userInteractionEnabled = YES;
        [_ScrollView addSubview:Imagestree];
        
        CustomVerticalLabel *ment = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+10, kBaseOriginY, 100, 40) text:@"餐厅公告" textSize:13.0f];
        ment.textColor = RGB(252, 114, 31);
        [Imagestree addSubview:ment];
        //细线
        UIImageView *streeLine = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, ment.bottom-5, Imagestree.frame.size.width, 1)];
        streeLine.backgroundColor = RGB(204, 204, 204);
        [Imagestree addSubview:streeLine];
        
        //公告内容
        Content = [[UITextView alloc] initWithFrame:CGRectMake(kBaseOriginX+distanceX, streeLine.bottom, kBaseWidth - 20, Imagestree.frame.size.height-30)];
        Content.textColor = RGB(253, 114, 31);
        Content.userInteractionEnabled = YES;
        Content.text = @" 天平派品牌管承诺，您的商品在您指定时间内送达 \n[品牌咨询专线]:4006-406-010 \n天平派";
        Content.font = [UIFont systemFontOfSize:14.0f];
        [Imagestree addSubview:Content];
        
        if ([Content.text isEqualToString:@""] ) {
            
            Imagestree.frame = CGRectMake(kBaseOriginX, sendview.bottom, kBaseOriginX, kBaseOriginY);
            Content.frame = CGRectMake(kBaseOriginX, streeLine.bottom, kBaseOriginX, kBaseOriginY);
            
        } else if (![Content.text isEqualToString:@""]) {
            Imagestree.frame = CGRectMake(kBaseOriginX, sendview.bottom+8, kBaseWidth-16, 100);
            Content.frame = CGRectMake(kBaseOriginX, streeLine.bottom, kBaseWidth - 15, Imagestree.frame.size.height-40);
        }

        //餐厅简介视图
        UIImageView *ImageFour = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, Imagestree.bottom+8, kBaseWidth-16, 72)];
        ImageFour.backgroundColor = RGB(255, 255, 255);
        [_ScrollView addSubview:ImageFour];
        
        UIImageView *LineFour = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY+36, ImageFour.frame.size.width, 1)];
        LineFour.backgroundColor = RGB(204, 204, 204);
        [ImageFour addSubview:LineFour];
        
        CustomVerticalLabel *Brief = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+distanceX, LineFour.top-37, 100, 40) text:@"餐厅简介" textSize:13.0f];
        Brief.textColor = RGB(153, 153, 153);
        [ImageFour addSubview:Brief];
        
        //餐厅简介
        BriefContent = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+distanceX, LineFour.bottom-8, 600, 50) text:@"土豪峰海鲜批发市场，海鲜来自大海洋" textSize:14.0f];
        BriefContent.textColor = RGB(51, 51, 51);
        [ImageFour addSubview:BriefContent];
        
        //店铺信息视图
        UIImageView *Imagefive = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, ImageFour.bottom+8, kBaseWidth-16, 180)];
        Imagefive.backgroundColor = RGB(255, 255, 255);
        [_ScrollView addSubview:Imagefive];
        
        
        //店铺信息文字
        CustomVerticalLabel *Message = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+distanceX, LineFour.top-40, 100, 40) text:@"店铺信息" textSize:13];
        Message.textColor = RGB(153, 153, 153);
        [Imagefive addSubview:Message];
        
        NSArray *MessageArray = @[@"餐厅地址：",@"营业时间：",@"商家营业执照",@"餐饮许可证"];
        for (int L = 0; L < MessageArray.count; L++) {
            //店铺信息文字
            CustomVerticalLabel *MessageLabel = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+distanceX,Message.bottom - 7 + L*35, 100, 40) text:[NSString stringWithFormat:@"%@",MessageArray[L]] textSize:14.0f];
            MessageLabel.textColor = RGB(51, 51, 51);
            [Imagefive addSubview:MessageLabel];
            
            //细线
            UIImageView *LineFive = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, Message.bottom-5 + L*35, Imagefive.frame.size.width, 1)];
            LineFive.backgroundColor = RGB(204, 204, 204);
            [Imagefive addSubview:LineFive];
            
        }
        DiningAddress = [CustomVerticalLabel createLabel:CGRectMake(Message.right-25, Message.bottom - 7, 400, 40) text:@"海淀区清华科技园文津国际公寓" textSize:14.0f];
        DiningAddress.textColor = RGB(51, 51, 51);
        [Imagefive addSubview:DiningAddress];
        
        DiningData = [CustomVerticalLabel createLabel:CGRectMake(Message.right-25, DiningAddress.bottom-5, 300, 40) text:@"10:00:00-20:40:00" textSize:14.0f];
        DiningData.textColor = RGB(51, 51, 51);
        [Imagefive addSubview:DiningData];
        
        permit = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth-70, DiningData.bottom-5, 100, 40) text:@"暂无 " textSize:14.0f];
        permit.textColor = RGB(153, 153, 153);
        [Imagefive addSubview:permit];
        
        license = [CustomVerticalLabel createLabel:CGRectMake(kBaseWidth-70, permit.bottom-5, 100, 40) text:@"暂无 " textSize:14.0f];
        license.textColor = RGB(153, 153, 153);
        [Imagefive addSubview:license];
        
    }
    return self;
}

//滚动视图开始时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == _ScrollView) {
        _userContentOffsetX = scrollView.contentOffset.y;
    }
}

//滚动视图结束
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _ScrollView) {
        //判断用户是否左滚动还是右滚动
        if (_userContentOffsetX < scrollView.contentOffset.y) {
            _isLeftScroll = YES;
        }
        else {
            _isLeftScroll = NO;
        }
    }
}

//滚动视图释放滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _ScrollView) {
        _isLeftScroll = YES;
        //调整顶部滑条按钮状态
        //int tag = (int)scrollView.contentOffset.x/self.bounds.size.width +100;
        //UIButton *button = (UIButton *)[_topScrollView viewWithTag:tag];
        //[self selectNameButton:button];
    }
}


@end
