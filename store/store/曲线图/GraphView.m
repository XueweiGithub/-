//
//  GraphView.m
//  store
//
//  Created by Mac02 on 15/5/29.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "GraphView.h"
#import "GraphObject.h"

//测试地址
#define kWebSiteURL @"http://test.tianpingpai.com/"

#define kGetFlankShopInfo       @"api/shopinfo/getShopInfo.json" 

@implementation GraphView
{
     NSArray *DataArray;
    
    NSMutableArray *tempArray;
    
    MoreStoreViewController *MoreStore;
    
    NSIndexPath *path;
    
    UIView *background;
    
    UIImageView *CancelView;  //取消图标
    
    UIImageView *GraphImage;  //白色背景
    
    CustomVerticalLabel *UserLabel;  //显示的文字
    
    NSMutableArray *GraphArray;
    
    //-------------------------------
    
    CustomVerticalLabel *priceLabel;     //价格
    
    CustomVerticalLabel *speciLabel;     //规格
    
    CustomVerticalLabel *describeLabel;  //描述
    
    CustomVerticalLabel *remarkLabel;    //备注
    
    CustomVerticalLabel *UnitLabel;      //单位
    
    CustomVerticalLabel *CurrentLabel;   //当前商品价格
    
    CustomVerticalLabel *AverageLabel;   //市场平均价格
    
}

-(void) OnclickCanceButton {
    NSLog(@"按钮");
    
    [UIView animateWithDuration:.3 animations:^{
        
        if (GraphImage.top == kBaseHeight+50) {
            GraphImage.top = kBaseHeight/2+10;
            background.alpha = .3;
        } else {
            GraphImage.top = kBaseHeight+50;
            //CancelView.top = kBaseHeight+300;
            background.alpha = .0;
        }
    }];
    
}

#define KLong 70

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        GraphArray = [NSMutableArray array];
        
        //遮罩视图
        background = [[UIView alloc] initWithFrame:self.bounds];
        background.backgroundColor = [UIColor blackColor];
        background.alpha = .0;
        [self addSubview:background];
        
        //UIImage  *cancel = [UIImage imageNamed:@""];
        CancelView = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+260, kBaseHeight-470, 40, 40)];
        CancelView.userInteractionEnabled = YES;
        CancelView.backgroundColor = [UIColor blackColor];
        [self addSubview:CancelView];
        
        UIButton *CanceBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, 40, 40)];

        [CanceBtn addTarget:self action:@selector(OnclickCanceButton) forControlEvents:UIControlEventTouchUpInside];
        CanceBtn.backgroundColor = [UIColor clearColor];
        [CancelView addSubview:CanceBtn];
        
       //---------------------------
        //商品图片背景
        UIImageView *shopView = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+10, kBaseHeight-380, 297, 140)];
        shopView.backgroundColor = [UIColor whiteColor];
        shopView.layer.cornerRadius = 6;   //绘制圆角
        //[self addSubview:shopView];
        
        //商品图片
        UIImage *image = [UIImage imageNamed:@""];
        UIImageView *shopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+5, kBaseOriginY+5, shopView.size.width-10, 100)];
        shopImageView.backgroundColor = [UIColor orangeColor];
        [shopView addSubview:shopImageView];
        
        if ([image isEqual: @""]) {
            shopView.frame = CGRectMake(kBaseOriginX, kBaseOriginY, 0, 0);
        }
        //---------------------------
        
        //白色背景
        GraphImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+10, kBaseHeight-260, 297, 238)];//238
        GraphImage.layer.cornerRadius = 6;   //绘制圆角
        GraphImage.userInteractionEnabled = YES;
        GraphImage.backgroundColor = [UIColor whiteColor];
        [self addSubview:GraphImage];
        
        
        NSArray *LabelArray = @[@"菜心",@"规格：",@"描述：",@"备注："];
        
        for (int i = 0; i < LabelArray.count; i++) {
            UserLabel = [CustomVerticalLabel createLabel:CGRectMake(kBaseOriginX+15, GraphImage.top-170+i*20, 100, 50) text:[NSString stringWithFormat:@"%@",LabelArray[i]] textSize:10.f];
            UserLabel.font = [UIFont systemFontOfSize:10.f];
            UserLabel.textColor = RGB(123, 123, 123);
            [GraphImage addSubview:UserLabel];
            
            if (i == 0) {
                UserLabel.font = [UIFont systemFontOfSize:12.0f];
                UserLabel.textColor = RGB(76, 76, 76);
                
                CustomVerticalLabel *unitLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right-20, GraphImage.top-150, 100, 50) text:@"单位：" textSize:10.0f];
                unitLabel.textColor = RGB(123, 123,123);
                [GraphImage addSubview:unitLabel];
            }
        }
        //价格
        priceLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right-KLong, GraphImage.top-170, 100, 50) text:@"¥8.0/斤" textSize:10.0f];
        priceLabel.textColor = RGB(232, 78, 64);
        [GraphImage addSubview:priceLabel];
        
        //规格
        speciLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right-KLong, priceLabel.top+20, 100, 50) text:@"长的" textSize:10.0f];
        speciLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:speciLabel];
        
        //描述
        describeLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right-KLong, speciLabel.top+20, 100, 50) text:@"广东" textSize:10.0f];
        describeLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:describeLabel];
        
        //备注
        remarkLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right-KLong, describeLabel.top+20, 100, 50) text:@"以上数据方便参考" textSize:10.0f];
        remarkLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:remarkLabel];
        
        //单位
        UnitLabel = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.right+10, priceLabel.top+20, 100, 50) text:@"斤" textSize:10.0f];
        UnitLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:UnitLabel];
        
        //细线
        UIImageView *LineCentre = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX, priceLabel.top+10, GraphImage.frame.size.width/2.3, 1)];
        LineCentre.backgroundColor = RGB(209, 209, 209);
        [GraphImage addSubview:LineCentre];

        //细线
        UIImageView *LineCentreRight = [[UIImageView alloc] initWithFrame:CGRectMake(GraphImage.size.width-GraphImage.size.width/2.3, priceLabel.top+10, GraphImage.size.width/2.3, 1)];
        LineCentreRight.backgroundColor = RGB(209, 209, 209);
        [GraphImage addSubview:LineCentreRight];
        
        //文字
        CustomVerticalLabel *PriceLa = [CustomVerticalLabel createLabel:CGRectMake(GraphImage.size.width/2-18, priceLabel.top-14, 80, 50) text:@"价格曲线" textSize:9.0f];
        PriceLa.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:PriceLa];
        
        //蓝点
        UIImageView *currentView = [[UIImageView alloc] initWithFrame:CGRectMake(UserLabel.size.width+130, GraphImage.top-300, 5, 5)];
        currentView.backgroundColor = RGB(37, 123, 209);
        [GraphImage addSubview:currentView];
        
        //红点
        UIImageView *averageView = [[UIImageView alloc] initWithFrame:CGRectMake(UserLabel.size.width+130, GraphImage.top-290, 5, 5)];
        averageView.backgroundColor = RGB(232,78,64);
        [GraphImage addSubview:averageView];
        
        #define Kwidth 60
        #define Kheight 50
        
        //价格文字
        CustomVerticalLabel *price_label = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.size.width-75, GraphImage.top-310, Kwidth, Kheight) text:@"价格" textSize:8.0f];
        price_label.textColor = RGB(76, 76, 76);
        [GraphImage addSubview:price_label];
        
        //时间/月
        CustomVerticalLabel *Data_Label = [CustomVerticalLabel createLabel:CGRectMake(UserLabel.size.width+165, GraphImage.top-194, Kwidth, Kheight) text:@"时间/月" textSize:8.0f];
        Data_Label.textColor = RGB(76, 76, 76);
        [GraphImage addSubview:Data_Label];
        
       //当前商品价格
        CurrentLabel = [CustomVerticalLabel createLabel:CGRectMake(currentView.right+5, currentView.frame.size.height-19, 100, 50) text:@"当前商品价格" textSize:6.0f];
        CurrentLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:CurrentLabel];
        
        //市场平均价格
        AverageLabel = [CustomVerticalLabel createLabel:CGRectMake(averageView.right+5, averageView.frame.size.height-9, 100, 50) text:@"市场平均价格" textSize:6.0f];
        AverageLabel.textColor = RGB(123, 123, 123);
        [GraphImage addSubview:AverageLabel];
        
        //折线图
        chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(kBaseOriginX, priceLabel.top-110, kBaseWidth-35, 115)withSource:self withStyle:UUChartLineStyle];
        [chartView showInView:GraphImage];
        
        [self Graph];
        
    }
    
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self Graph];
}

-(void) Graph {
    
    
    //第一步，创建URL
    
    NSString *strG = [NSString stringWithFormat:@"http://test.tianpingpai.com/api/prod/getSaleProdDetailInfo.json?id=1"];
    NSURL *url = [NSURL URLWithString:strG];
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
        
        DLog(@"%@",jsonObject);
        
        
        NSArray *history_prices = [[jsonObject valueForKey:@"result"]valueForKey:@"history_prices"];
        DLog(@"history_prices:%@",history_prices);
        
        //        NSArray *array = history_prices[@"price_list"];
        //
        //        NSLog(@"arry:%lu",(unsigned long)array.count);
        tempArray = [NSMutableArray array];
        
        
        for (NSDictionary *dict in history_prices) {
            DLog(@"dict:%@",dict);
            
            
            NSArray *array = dict[@"price_list"];
            
            // NSLog(@"arry:%lu",(unsigned long)array.count);
            
            
            for (NSDictionary *getDict in array) {
                GraphObject *graph = [[GraphObject alloc]init];
                
                
                graph.date = getDict[@"date"];
                graph.price = getDict[@"price"];
                
                [tempArray addObject:graph.price];
                
                NSLog(@"tempArray:%@",tempArray);
            }
            
            DataArray = tempArray;
            
            NSLog(@"DataArray:%@",DataArray);
            
            //   [chartView strokeChart];
            
            
        }
    }];

}

- (NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=1; i<=20; i++) {
        NSString * str = [NSString stringWithFormat:@"%d",i];
        [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    if (path.section==0) {
    
        return [self getXTitles:12];
    }
    return [self getXTitles:20];
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary4 = @[@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5"];
//    NSArray *ary5 = @[@"0",@"2",@"4",@"4.5",@"6",@"4.2",@"4.1",@"7.2",@"7.5",@"2",@"4.5",@"6"];
//    
    return @[ary4];
    
    
        NSMutableArray *array = [NSMutableArray array];
    
    DLog(@"%@",DataArray);
        for (GraphObject *graph in DataArray) {

        [array addObject:[NSString stringWithFormat:@"%@",graph.price]];
            
            NSLog(@"graph.price  ::%@",graph.price);
        }
    
        return array;
}

#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUBlue,UURed,UUBrown];
}
//显示数值范围
- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
    if (path.section==0 && (path.row==0|path.row==1)) {
        return CGRangeMake(20, 0);
    }
    
    
    return CGRangeZero;
}

#pragma mark 折线图专享功能

//标记数值区域
- (CGRange)UUChartMarkRangeInLineChart:(UUChart *)chart
{
    if (path.row==2) {
        return CGRangeMake(25, 75);
    }
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

//判断显示最大最小值
- (BOOL)UUChart:(UUChart *)chart ShowMaxMinAtIndex:(NSInteger)index
{
    return path.row==2;
}

    
@end
