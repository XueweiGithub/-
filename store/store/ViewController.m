//
//  ViewController.m
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
//        //坐标系的颜色
//        NSDictionary *_themeAttributes = @{
//                                           kXAxisLabelColorKey : RGB(209,209,209), //[UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
//                                           kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
//                                           kYAxisLabelColorKey : RGB(209,209,209),//[UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
//                                           kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
//                                           kYAxisLabelSideMarginsKey : @20,
//                                           kPlotBackgroundLineColorKye : RGB(209,209,209),//[UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4]
//                                           };
//        _lineGraph.themeAttributes = _themeAttributes;
//
//
//        _lineGraph.yAxisRange = @(98);
//        _lineGraph.yAxisSuffix = @"K";
//        _lineGraph.xAxisValues = @[
//                                   @{ @1 : @"1" },
//                                   @{ @2 : @"2" },
//                                   @{ @3 : @"3" },
//                                   @{ @4 : @"4" },
//                                   @{ @5 : @"5" },
//                                   @{ @6 : @"6" },
//                                   @{ @7 : @"7" },
//                                   @{ @8 : @"8" },
//                                   @{ @9 : @"9" },
//                                   @{ @10 : @"10" },
//                                   @{ @11 : @"11" },
//                                   @{ @12 : @"12" }
//                                   ];
//        SHPlot *_plot1 = [[SHPlot alloc] init];
//
//        // 根据值控制曲线的变化
//        _plot1.plottingValues = @[
//                                  @{ @1 : @1 },
//                                  @{ @2 : @10 },
//                                  @{ @3 : @23 },
//                                  @{ @4 : @22 },
//                                  @{ @5 : @12.3 },
//                                  @{ @6 : @45.8 },
//                                  @{ @7 : @56 },
//                                  @{ @8 : @97 },
//                                  @{ @9 : @65 },
//                                  @{ @10 : @10 },
//                                  @{ @11 : @67 },
//                                  @{ @12 : @23 }
//                                  ];
//
//        NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
//        _plot1.plottingPointsLabels = arr;
//
//        //曲线区域内的颜色值
//        NSDictionary *_plotThemeAttributes = @{
//                                               kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
//                                               kPlotStrokeWidthKey : @2,
//                                               kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
//                                               kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
//                                               kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
//                                               };
//
//        _plot1.plotThemeAttributes = _plotThemeAttributes;
//        [_lineGraph addPlot:_plot1];
//        [_lineGraph setupTheView];
//
//        [GraphImage addSubview:_lineGraph];
