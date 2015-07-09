//
//  AddMyAttenceViewController.m
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import "AddMyAttenceViewController.h"
#import "MapAddress.h"
#import "UIDevice+MyUUID.h"

@interface AddMyAttenceViewController ()
{
    YHSYHttpRequest *_request;
    UILabel *_locationLabel;
    NSString *_latitudeAndLongitude;
    NSString *_address;
    NSString *_signInTime;
    NSString *_signOutTime;
    UILabel *_signInSuccessLabel;
    UILabel *_signInFailedLabel;
    UILabel *_signOutSuccessLabel;
    UILabel *_signOutFailedLabel;
    UILabel *_getLocationFailed;
    NSInteger _flag;
    BOOL _isSignIn;
}
@end

@implementation AddMyAttenceViewController

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
    
    self.title = @"我的考勤";
    [self addButtonItemWithImage:GOBACK_IMAGE selectedImage:nil title:nil frame:CGRectMake(0, 0, 25, 25) selector:@selector(goBackButtonClick) isLeft:YES];
    for (int i = 0; i < 2; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+(20+20)*i, 80, 30)];
        if (i == 0) {
            label.text = @"用户名：";
        }else{
            label.text = @"当前位置：";
        }
        label.textColor = [UIColor blueColor];
        label.font = [UIFont systemFontOfSize:15.0f];
        [self.view addSubview:label];
    }
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 220, 30)];
    userNameLabel.text = _userName;
    userNameLabel.textColor = [UIColor blueColor];
    userNameLabel.layer.masksToBounds = YES;
    userNameLabel.layer.cornerRadius = 5.0;
    userNameLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    userNameLabel.layer.borderWidth = 1.0;
    userNameLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.view addSubview:userNameLabel];
    
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 220, 30)];
    _locationLabel.textColor = [UIColor blueColor];
    _locationLabel.layer.masksToBounds = YES;
    _locationLabel.layer.cornerRadius = 5.0;
    _locationLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _locationLabel.layer.borderWidth = 1.0;
    _locationLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.view addSubview:_locationLabel];
    
    //签到按钮
    UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signInButton.frame = CGRectMake(80, 150, 60, 30);
    [signInButton setTitle:@"签到" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signInButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [signInButton setBackgroundImage:[UIImage imageNamed:BUTTONBACK_IMAGE] forState:UIControlStateNormal];
    [signInButton addTarget:self action:@selector(signInButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInButton];
    
    //签退按钮
    UIButton *signOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signOutButton.frame = CGRectMake(180, 150, 60, 30);
    [signOutButton setTitle:@"签退" forState:UIControlStateNormal];
    [signOutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signOutButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [signOutButton setBackgroundImage:[UIImage imageNamed:BUTTONBACK_IMAGE] forState:UIControlStateNormal];
    [signOutButton addTarget:self action:@selector(signOutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signOutButton];
    
    
    //签到成功
    _signInSuccessLabel = [self createOperationResultLabelWithFrame:CGRectMake(90, [DeviceManager currentScreenHeight]-205, 140, 30) backGroundColor:[UIColor blackColor] text:@"签到成功！" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    //签到失败
    _signInFailedLabel = [self createOperationResultLabelWithFrame:CGRectMake(90, [DeviceManager currentScreenHeight]-205, 140, 30) backGroundColor:[UIColor blackColor] text:@"签到失败，请重试~" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    //签退成功
    _signOutSuccessLabel = [self createOperationResultLabelWithFrame:CGRectMake(90, [DeviceManager currentScreenHeight]-205, 140, 30) backGroundColor:[UIColor blackColor] text:@"签退成功！" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    //签退失败
    _signOutFailedLabel = [self createOperationResultLabelWithFrame:CGRectMake(90, [DeviceManager currentScreenHeight]-205, 140, 30) backGroundColor:[UIColor blackColor] text:@"签退失败，请重试~" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    
    //定位失败
    _getLocationFailed = [self createOperationResultLabelWithFrame:CGRectMake(70, [DeviceManager currentScreenHeight]-205, 180, 30) backGroundColor:[UIColor blackColor] text:@"定位失败，请打开定位服务" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:14.0f]];
    
    //创建自定义刷新视图
    [self createRefreshView];
    
    //初始化BMKLocationService
    _locationService = [[BMKLocationService alloc]init];
    _locationService.delegate = self;
    
}

//签到
- (void)signInButtonClick{
    _isSignIn = YES;
    if (!self.startDate.length) {
        //启动LocationService
        [_refreshView startRefresh];
        _refreshView.hidden = NO;
        [_locationService startUserLocationService];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您已完成签到！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
}

//签退
- (void)signOutButtonClick{
    _isSignIn = NO;
    if (self.startDate.length) {
        if (self.endDate.length) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您已完成签退！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
        }else{
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm:ss"];
            NSString *time = [formatter stringFromDate:[NSDate date]];
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"确认签退？工作时间：%@--%@",self.startDate,time] delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
            alterView.tag = 100;
            [alterView show];
        }
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您还未签到，无法进行签退！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
}

#pragma mark - alterViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 100) {
        if (buttonIndex == 0) {
            //启动LocationService
            [_refreshView startRefresh];
            _refreshView.hidden = NO;
            [_locationService startUserLocationService];
        }
    }
}


#pragma mark - BMKLocationServiceDelegate
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation{
    [_locationService stopUserLocationService];
    NSLog(@"定位成功");
    [_refreshView stopRefresh];
    _refreshView.hidden = YES;
    
    _getLocationFailed.hidden = YES;
    double latitude = userLocation.location.coordinate.latitude;
    double longitude = userLocation.location.coordinate.longitude;
    _latitudeAndLongitude = [NSString stringWithFormat:@"%f,%f",latitude,longitude];
    //    _searcher =[[BMKGeoCodeSearch alloc]init];
    //    _searcher.delegate = self;
    //    CLLocationCoordinate2D coordinate2D = (CLLocationCoordinate2D){latitude, longitude};
    //    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    //    reverseGeoCodeSearchOption.reverseGeoPoint = coordinate2D;
    //    BOOL flag = [_searcher reverseGeoCode:reverseGeoCodeSearchOption];
    //    if(flag)
    //    {
    //      NSLog(@"反geo检索发送成功");
    //    }
    //    else
    //    {
    //      NSLog(@"反geo检索发送失败");
    //    }
    //地址反编码
    NSData *addressData = [MapAddress getBaiduAddress:userLocation.location];
    if (addressData != nil) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:addressData options:0 error:0];
        if (jsonDic != nil) {
            if (![[jsonDic objectForKey:@"result"] isEqual:[NSNull null]]) {
                NSDictionary *resultDic = [jsonDic objectForKey:@"result"];
                if (![[resultDic objectForKey:@"formatted_address"] isEqual:[NSNull null]]) {
                    _address = [resultDic objectForKey:@"formatted_address"];
                    _locationLabel.text = _address;
                    if (_isSignIn) {
                        [self sendSignInRequest];
                    }else{
                        [self sendSignOutRequest];
                    }
                }
            }
        }
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"操作失败，请检查网络连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"定位失败：%@",error);
    [_refreshView stopRefresh];
    _refreshView.hidden = YES;
    _flag = 5;
    [self viewAppear];
}



- (void)viewAppear{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.1;
    switch (_flag) {
        case 1:
        {
            [_signInSuccessLabel.layer addAnimation:animation forKey:nil];
            _signInSuccessLabel.hidden = NO;
        }
            break;
        case 2:
        {
            [_signInFailedLabel.layer addAnimation:animation forKey:nil];
            _signInFailedLabel.hidden = NO;
        }
            break;
        case 3:
        {
            [_signOutSuccessLabel.layer addAnimation:animation forKey:nil];
            _signOutSuccessLabel.hidden = NO;
        }
            break;
        case 4:
        {
            [_signOutFailedLabel.layer addAnimation:animation forKey:nil];
            _signOutFailedLabel.hidden = NO;
        }
            break;
        case 5:
        {
            [_getLocationFailed.layer addAnimation:animation forKey:nil];
            _getLocationFailed.hidden = NO;
        }
            break;
            
        default:
            break;
    }
    
    [self performSelector:@selector(viewHidden) withObject:nil afterDelay:2];
}

- (void)viewHidden{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.3;
    [_signInSuccessLabel.layer addAnimation:animation forKey:nil];
    _signInSuccessLabel.hidden = YES;
    [_signInFailedLabel.layer addAnimation:animation forKey:nil];
    _signInFailedLabel.hidden = YES;
    [_signOutSuccessLabel.layer addAnimation:animation forKey:nil];
    _signOutSuccessLabel.hidden = YES;
    [_signOutFailedLabel.layer addAnimation:animation forKey:nil];
    _signOutFailedLabel.hidden = YES;
}


#pragma mark - BMKGeoCodeSearchDelegate
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:
(BMKReverseGeoCodeResult *)result
                       errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        NSLog(@"%@",result.address);
    }
    else {
        NSLog(@"抱歉，未找到结果");
    }
}


//发送签到请求
- (void)sendSignInRequest{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [self setFormatterDate:formatter];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *time = [formatter stringFromDate:[NSDate date]];
    NSString *signInDate = [NSString stringWithFormat:@"%@T%@",date,time];
    _signInTime = time;
    //NSString *deviceName = [UIDevice currentDevice].identifierForVendor.UUIDString;
    NSString *deviceName = [UIDevice currentDevice].myUUID;
    [_refreshView startRefresh];
    _refreshView.hidden = NO;
    //?action=AttenceSignInfo_set&operation=0&userid=1&
    NSDictionary *parmDic = [NSDictionary dictionaryWithObjectsAndKeys:@"AttenceSignInfo_set",@"action",@"0",@"operation",_userID,@"userid",signInDate,@"startdate",_address,@"address",_latitudeAndLongitude,@"longitude",deviceName,@"devicenumber", nil];
    //1BB02335-8E7F-4EB2-98FB-5A55B7A0021C
    NSLog(@"%@",parmDic);
   // _request = [[YHSYHttpRequest alloc] postConnectionWithHead:MyAttenceHead parmDic:parmDic finishedBlock:^(NSData *data) {
       // [_refreshView stopRefresh];
      //  _refreshView.hidden = YES;
      //  [self analysisResultData:data];
    //} failedBlock:^(NSString *errorMessage) {
        //[_refreshView stopRefresh];
     //   _refreshView.hidden = YES;
       // NSLog(@"请求失败！错误信息：%@",errorMessage);
  //  }];
}

//发送签退请求
- (void)sendSignOutRequest{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [self setFormatterDate:formatter];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *time = [formatter stringFromDate:[NSDate date]];
    NSString *signOutDate = [NSString stringWithFormat:@"%@T%@",date,time];
    _signOutTime = time;
    //NSString *deviceName = [UIDevice currentDevice].identifierForVendor.UUIDString;
    NSString *deviceName = [UIDevice currentDevice].myUUID;
    [_refreshView startRefresh];
    _refreshView.hidden = NO;
    //?action=AttenceSignInfo_set&operation=1&userid=1&
    NSDictionary *parmDic = [NSDictionary dictionaryWithObjectsAndKeys:@"AttenceSignInfo_set",@"action",@"1",@"operation",_userID,@"userid",signOutDate,@"enddate",_address,@"addressback",_latitudeAndLongitude,@"longitudeback",deviceName,@"deviceback", nil];
    NSLog(@"%@",parmDic);
    //_request = [[YHSYHttpRequest alloc] postConnectionWithHead:MyAttenceHead parmDic:parmDic finishedBlock:^(NSData *data) {
       // [_refreshView stopRefresh];
       // _refreshView.hidden = YES;
       // [self analysisResultData:data];
   // } failedBlock:^(NSString *errorMessage) {
       // [_refreshView stopRefresh];
      //  _refreshView.hidden = YES;
       // NSLog(@"请求失败！错误信息：%@",errorMessage);
   // }];
}

//解析请求结果数据
- (void)analysisResultData:(NSData *)data{
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
    NSDictionary *resultDic = [jsonDic objectForKey:@"result"];
    NSDictionary *statusDic = [resultDic objectForKey:@"status"];
    NSString *msg = [statusDic objectForKey:@"msg"];
    if ([msg isEqualToString:@"succ"]) {
        if (_isSignIn) {
            self.startDate = _signInTime;
            _flag = 1;
            [self viewAppear];
        }else{
            self.endDate = _signOutTime;
            _flag = 3;
            [self viewAppear];
        }
    }else{
        if (_isSignIn) {
            _flag = 2;
            [self viewAppear];
        }else{
            _flag = 4;
            [self viewAppear];
        }
    }
}


//返回
- (void)goBackButtonClick{
    [self.delegate refreshView];
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
