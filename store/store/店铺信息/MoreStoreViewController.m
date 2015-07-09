//
//  MoreStoreViewController.m
//  store
//
//  Created by Mac02 on 15/5/28.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "MoreStoreViewController.h"
#import "MoreTableViewCell.h"
#import "GraphView.h"

@interface MoreStoreViewController () <UITableViewDataSource,UITableViewDelegate>

{
    UITableView *DataTable;
    
    NSMutableArray *DataArray;
    
    UIButton *rigthtBtn;
    
    GraphView *graphview;
}

@end

@implementation MoreStoreViewController

- (void) OnclickMoreButton {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(242, 242, 242);
    
    self.title = @"更多店铺";
    
    DataArray = [[NSMutableArray alloc] init];  //数组初始化
    
    DataTable = [[UITableView alloc] initWithFrame:CGRectMake(kBaseOriginX+8, kBaseOriginY+10, kBaseWidth-16, kBaseHeight-10)style:UITableViewStyleGrouped];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    DataTable.userInteractionEnabled = YES;
    [self.view addSubview:DataTable];
   
//    rigthtBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, 90, 20)];
//    rigthtBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
//    [rigthtBtn setTitleColor:RGB(136, 180, 6) forState:UIControlStateNormal];
//    [rigthtBtn setTitle:@"曲线图" forState:UIControlStateNormal];
//    [rigthtBtn addTarget:self action:@selector(OnclickMoreButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *BarMoreItem = [[UIBarButtonItem alloc] initWithCustomView:rigthtBtn];
    self.navigationItem.rightBarButtonItem = BarMoreItem;

}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;//DataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175;
}

//头、尾视图大小设置
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"storeCell";
    
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.userInteractionEnabled = YES;
    
    __AnNiButton = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX+220, kBaseOriginY+40, 90, 4)];
    [__AnNiButton setTitle:@"折线图" forState:UIControlStateNormal];
    [__AnNiButton addTarget:self action:@selector(OnclickBUtton) forControlEvents:UIControlEventTouchUpInside];
    [__AnNiButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cell addSubview:__AnNiButton];
    
    if (DataArray.count > 0) {
        
        //cell.frame = CGRectMake(kBaseOriginX+8, kBaseOriginY, kBaseWidth-16, kBaseHeight-87);
    }
    return cell;
}

-(void) OnclickBUtton {
    NSLog(@"按钮");
    
    GraphView *view = [[GraphView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY-20, kBaseWidth, kBaseHeight)];
    [self.view addSubview:view];
    
    [UIView animateWithDuration:.3 animations:^{
        
                if (view.top == kBaseHeight+50) {
                    view.top = kBaseHeight/2+10;
                    //background.alpha = .3;
                } else {
                    //view.top = kBaseHeight+50;
                    //CancelView.top = kBaseHeight+300;
                    //background.alpha = .0;
                }
            }];

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
