//
//  GraViewController.m
//  store
//
//  Created by Mac02 on 15/6/12.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "GraViewController.h"
#import "GraphObject.h"
@interface GraViewController ()
{
    NSIndexPath *path;
    
    NSArray *DataArray;
     NSMutableArray *tempArray;
}
@end

@implementation GraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    UIImageView *faceImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 50, 32, 32)];
//    CALayer *lay  = faceImg.layer;//获取ImageView的层
//    [lay setMasksToBounds:YES];
//    faceImg.center = self.view.center;
//    faceImg.backgroundColor = [UIColor redColor];
//    [lay setCornerRadius:6.0];//值越大，角度越圆
//    [self.view addSubview:faceImg];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(1.0, 5.0, 60.0, 60.0)];
    imageView.layer.cornerRadius = imageView.frame.size.height/2;
    imageView.layer.masksToBounds = YES;
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setClipsToBounds:YES];
    imageView.layer.shadowColor = [UIColor whiteColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(4.0, 4.0);
    imageView.layer.shadowOpacity = 0.5;
    imageView.layer.shadowRadius = 2.0;
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 2.0f;
    //imageView.image = [UIImage imageNamed:@"profileIcon.png"];
    [self.view addSubview:imageView];
    
    
    [self Graph];
    
    chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(kBaseOriginX, kBaseHeight-190, kBaseWidth-35, 115)withSource:self withStyle:UUChartLineStyle];
    [chartView showInView:self.view];

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
        
            
        NSArray *history_prices = [[jsonObject valueForKey:@"result"]valueForKey:@"history_prices"];
       // DLog(@"history_prices:%@",history_prices);
        
        
        tempArray = [NSMutableArray array];
        
        
        for (NSDictionary *dict in history_prices) {
           // DLog(@"dict:%@",dict);
            
            
            NSArray *array = dict[@"price_list"];
            
            
            for (NSDictionary *getDict in array) {
                GraphObject *graph = [[GraphObject alloc]init];
                
                graph.date = getDict[@"date"];
                graph.price = getDict[@"price"];
                
                [tempArray addObject:graph.price];
                
                //   NSLog(@"tempArray:%@",tempArray);
            }
            
            DataArray = tempArray;
            
            NSLog(@"DataArray:%@",DataArray);
        }
         //[chartView strokeChart];
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
   
    //NSArray *ary4 = @[@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5"];
    //return @[ary4];
    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5", nil];
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
