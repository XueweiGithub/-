//
//  MoreTableViewCell.m
//  store
//
//  Created by Mac02 on 15/5/28.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "MoreTableViewCell.h"

@implementation MoreTableViewCell
{
    @private
    UIImageView *HeadImage;            //图片
    
    CustomVerticalLabel *marketName;   //市场名字
    
    CustomVerticalLabel *peoplenum;    //评论人数
    
    CustomVerticalLabel *category;     //品类
    
    CustomVerticalLabel *averagepoin;  //平均分
    
    CustomVerticalLabel *commentspoin; //评论分

}
-(void) Onclick {
    NSLog(@"按钮");
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //头部view
        UIImageView *HeadView = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+8, kBaseOriginY+20, kBaseWidth-16, 130)];
        HeadView.backgroundColor = RGB(255, 255, 255);
        [self addSubview:HeadView];
        
        //细线
        UIImageView *HeadLine = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, 65
                                                                              , kBaseWidth-16, 1)];
        HeadLine.backgroundColor = RGB(204, 204, 204);
        [HeadView addSubview:HeadLine];
        
        
        //头像
        HeadImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+12, 12, 40, 40)];
        HeadImage.backgroundColor = [UIColor grayColor];
        HeadImage.userInteractionEnabled = YES;
        [HeadView addSubview:HeadImage];
        
//        UIButton *HeadButton = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY,HeadImage.size.width, HeadImage.size.height)];
//        HeadButton.userInteractionEnabled = YES;
//        [HeadButton addTarget:self action:@selector(Onclick) forControlEvents:UIControlEventTouchUpInside];
//        [HeadView addSubview:HeadButton];
        
        
        marketName = [CustomVerticalLabel createLabel:CGRectMake(HeadImage.right + 10, HeadImage.top-10, 200, 40) text:@"土豪峰海鲜批发市场" textSize:15.0f];
        marketName.textColor = RGB(51, 51, 51);
        [HeadView addSubview:marketName];
        
        for (int i = 0; i <5 ; i++) {
            //星星图片
            UIImage *stars = [UIImage imageNamed:@"yellow_star@2x.png"];
            UIImageView *starsImage = [[UIImageView alloc] initWithFrame:CGRectMake(HeadImage.right+10 + i*15, HeadView.top+20, stars.size.width, stars.size.height)];
            starsImage.image = stars;
            [HeadView addSubview:starsImage];
        }
        
        //评论人数
        peoplenum = [CustomVerticalLabel createLabel:CGRectMake(HeadImage.right+93, HeadView.top+7, 100, 40) text:@"(188)" textSize:11.0f];
        peoplenum.textColor = RGB(153, 153, 153);
        [HeadView addSubview:peoplenum];
        
        //品类
        category = [CustomVerticalLabel createLabel:CGRectMake(HeadImage.right+125, HeadView.top+7, 100, 40) text:@"中式,奶茶" textSize:11];
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

    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
