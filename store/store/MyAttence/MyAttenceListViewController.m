//
//  MyAttenceListViewController.m
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import "MyAttenceListViewController.h"
#import "MyAttenceModel.h"
#import "MyAttenceCell.h"
#import "DetailAttenceInfoViewController.h"
#import "AddMyAttenceViewController.h"
#import "DEFINE.h"
@interface MyAttenceListViewController ()<AddMyAttenceViewControllerDelegate>
{
    YHSYHttpRequest *_request;
    NSString *_userID;
    NSString *_userName;
    UILabel *_operationLabel;
    NSInteger _dataIndex;
    BOOL _canLoad;
    BOOL _isAll;
}
@end

@implementation MyAttenceListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"考勤列表";
    
    _userID = [[self.dataDic objectForKey:@"User_ID"] stringValue];
    _userName = [self.dataDic objectForKey:@"User_Name"];
    
    [self addButtonItemWithImage:GOBACK_IMAGE selectedImage:nil title:nil frame:CGRectMake(0, 0, 25, 25) selector:@selector(goBackButtonClick) isLeft:YES];
    
    [self addButtonItemWithImage:BUTTONBACK_IMAGE selectedImage:nil title:@"考勤" frame:CGRectMake(0, 0, 50, 30) selector:@selector(attenceButtonClick) isLeft:NO];
    
    UILabel *attenceTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
    attenceTimeLabel.text = @"考勤时段：08:30 - 17:30";
    attenceTimeLabel.textAlignment = NSTextAlignmentCenter;
    attenceTimeLabel.font = [UIFont systemFontOfSize:15.0f];
    attenceTimeLabel.backgroundColor = [UIColor whiteColor];
    attenceTimeLabel.layer.masksToBounds = YES;
    attenceTimeLabel.layer.cornerRadius = 5.0f;
    attenceTimeLabel.layer.borderWidth = 1.0;
    attenceTimeLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //[self.view addSubview:attenceTimeLabel];
    _canLoad = YES;
    _isAll = NO;
    _statusArray = [[NSArray alloc] initWithObjects:@"正常",@"迟到",@"早退",@"迟到早退", nil];
    
    _tableView.frame = CGRectMake(10, 0, 300, [DeviceManager currentScreenHeight]-64);
    _dataIndex = 1;
    //已加载全部数据
    _operationLabel = [self createOperationResultLabelWithFrame:CGRectMake(100, [DeviceManager currentScreenHeight]-105, 120, 30) backGroundColor:[UIColor blackColor] text:@"已加载全部数据" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    
    //创建自定义刷新视图
    [self createRefreshView];
    
    [self sendAttenceListRequest];
}

//发送考勤列表请求
- (void)sendAttenceListRequest{
    [_refreshView startRefresh];
    _refreshView.hidden = NO;
    //?action=AttenceSignList_get&operation=0&userid=1&dataindex=1&datasize=10&
    NSDictionary *parmDic = [NSDictionary dictionaryWithObjectsAndKeys:@"AttenceSignList_get",@"action",@"0",@"operation",_userID,@"userid",[NSString stringWithFormat:@"%ld",(long)_dataIndex],@"dataindex",@"10",@"datasize", nil];
    NSLog(@"%@",parmDic);
//    _request = [[YHSYHttpRequest alloc] postConnectionWithHead:MyAttenceCell parmDic:parmDic finishedBlock:^(NSData *data) {
//        [_refreshView stopRefresh];
//        _refreshView.hidden = YES;
//        [self analysisData:data];
//    } failedBlock:^(NSString *errorMessage) {
//        [_refreshView stopRefresh];
//        _refreshView.hidden = YES;
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"考勤列表数据请求失败，请检查网络连接~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        [alertView show];
//        NSLog(@"错误信息：%@",errorMessage);
//    }];
}

//解析考勤列表数据
- (void)analysisData:(NSData *)data{
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
    NSDictionary *resultDic = [jsonData objectForKey:@"result"];
    NSArray *dataArr = [resultDic objectForKey:@"data"];
    if (dataArr.count) {
        for (NSDictionary *dataDic in dataArr) {
            MyAttenceModel *model = [[MyAttenceModel alloc] init];
            if ([self isNotNullInDictionary:dataDic key:@"StartDate"]) {
                model.startDate = [dataDic objectForKey:@"StartDate"];
            }else{
                model.startDate = @"";
            }
            if ([self isNotNullInDictionary:dataDic key:@"EndDate"]) {
                model.endDate = [dataDic objectForKey:@"EndDate"];
            }else{
                model.endDate = @"";
            }
            if ([self isNotNullInDictionary:dataDic key:@"Address"]) {
                model.address = [dataDic objectForKey:@"Address"];
            }
            if ([self isNotNullInDictionary:dataDic key:@"AddressBack"]) {
                model.addressBack = [dataDic objectForKey:@"AddressBack"];
            }
            if ([self isNotNullInDictionary:dataDic key:@"DeviceNumber"]) {
                model.deviceNumber = [dataDic objectForKey:@"DeviceNumber"];
            }
            if ([self isNotNullInDictionary:dataDic key:@"DeviceBack"]) {
                model.deviceBack = [dataDic objectForKey:@"DeviceBack"];
            }
            if ([self isNotNullInDictionary:dataDic key:@"Status"]) {
                model.status = [[dataDic objectForKey:@"Status"] stringValue];
            }
            if ([self isNotNullInDictionary:dataDic key:@"Summary"]) {
                model.summary = [dataDic objectForKey:@"Summary"];
            }else{
                model.summary = @"";
            }
            [_dataArray addObject:model];
        }
        
    }else{
        _isAll = YES;
        [self viewAppear];
    }
    [_tableView reloadData];
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyAttenceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[MyAttenceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"10.png"]];
        cell.backgroundView = imageView;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.signInButton.selected = NO;
    cell.signOutButton.selected = NO;
    cell.startDateLabel.text = @"";
    cell.endDateLabel.text = @"";
    MyAttenceModel *model = [_dataArray objectAtIndex:indexPath.row];
    if (model.startDate.length) {
        cell.signInButton.selected = YES;
        cell.startDateLabel.text = model.startDate;
    }
    if (model.endDate.length) {
        cell.signOutButton.selected = YES;
        cell.endDateLabel.text = model.endDate;
    }
    NSInteger index = [model.status integerValue];
    cell.statusLabel.text = [_statusArray objectAtIndex:index];
    if (index == 0) {
        cell.statusLabel.textColor = [UIColor greenColor];
    }else{
        cell.statusLabel.textColor = [UIColor redColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyAttenceModel *model = [_dataArray objectAtIndex:indexPath.row];
    DetailAttenceInfoViewController *daivc = [[DetailAttenceInfoViewController alloc] init];
    daivc.model = model;
    [self.navigationController pushViewController:daivc animated:YES];
}

//考勤按钮
- (void)attenceButtonClick{
    AddMyAttenceViewController *amavc = [[AddMyAttenceViewController alloc] init];
    amavc.userID = _userID;
    amavc.userName = _userName;
    amavc.delegate = self;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [self setFormatterDate:formatter];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    amavc.startDate = @"";
    amavc.endDate = @"";
    for (MyAttenceModel *model in _dataArray) {
        if (model.startDate.length) {
            NSString *startDate = [model.startDate substringToIndex:10];
            if ([startDate isEqualToString:dateStr]) {
                amavc.startDate = [model.startDate substringFromIndex:11];
            }
        }
        if (model.endDate.length) {
            NSString *endDate = [model.endDate substringToIndex:10];
            if ([endDate isEqualToString:dateStr]) {
                amavc.endDate = [model.endDate substringFromIndex:11];
            }
        }
    }
    [self.navigationController pushViewController:amavc animated:YES];
}

#pragma mark - AddMyAttenceViewControllerDelegate
- (void)refreshView{
    _dataIndex = 1;
    [_dataArray removeAllObjects];
    [self sendAttenceListRequest];
}

- (void)viewAppear{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.1;
    [_operationLabel.layer addAnimation:animation forKey:nil];
    _operationLabel.hidden = NO;
    [self performSelector:@selector(viewHidden) withObject:nil afterDelay:2];
}

- (void)viewHidden{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.3;
    [_operationLabel.layer addAnimation:animation forKey:nil];
    _operationLabel.hidden = YES;
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_canLoad) {
        if (!_isAll) {
            if (scrollView.contentOffset.y > 0) {
                if (scrollView.contentOffset.y+scrollView.frame.size.height > scrollView.contentSize.height+80) {
                    _canLoad = NO;
                    _dataIndex++;
                    [self sendAttenceListRequest];
                }
            }
            
        }else{
            
        }
        
    }
    
    
}

#pragma mark - scrollVieDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _canLoad = YES;
    NSLog(@"123");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    _canLoad = YES;
    NSLog(@"456");
}

//返回
- (void)goBackButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
