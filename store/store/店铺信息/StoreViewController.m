//
//  StoreViewController.m
//  store
//
//  Created by Mac02 on 15/5/27.
//  Copyright (c) 2015年 Mac02. All rights reserved.
//

#import "StoreViewController.h"
#import "MoreStoreViewController.h"
#import "GraphView.h"

@interface StoreViewController () <UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
{
    UIButton *rigthtBtn;
    
    UIActionSheet *_actionSheet;   //警告窗口
    
    UIImagePickerController *_ipc;  //图片类
    
    UIImageView *HeadImage;
    
     BOOL _isCamera;
    
    UIImage *_image;
    
    NSString *_imgName;
    
    GraphView *view;
    
    UIView *Dibuview;
    
}

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"店铺信息";
    self.view.backgroundColor= RGB(242, 242, 242);
    self.view.userInteractionEnabled = YES;
    
   Dibuview = [[UIView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, kBaseWidth, kBaseHeight)];
    Dibuview.backgroundColor = RGB(242, 242, 242);
    Dibuview.alpha = .0;
    [self.view addSubview:Dibuview];
    
    ScrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY+87, kBaseWidth-8, kBaseHeight-30)];
    ScrollView.pagingEnabled = NO; //是否翻页
    ScrollView.backgroundColor = [UIColor clearColor];
    ScrollView.showsVerticalScrollIndicator =YES; //垂直方向的滚动指示
    ScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;//滚动指示的风格
    [self.view addSubview:ScrollView];
    
    ScrollView.contentSize =  CGSizeMake(kBaseWidth-16, kBaseHeight+50+20+10); // 设置UIScrollView的滚动范围
    
    // 隐藏水平滚动条
    ScrollView.showsVerticalScrollIndicator = NO;   //隐藏数值滑动条
   // ScrollView.bounces = NO;  //去掉弹簧效果
    
    
    //店铺信息视图初始化
    _StoreView = [[StoreView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY-60, _StoreView.size.width,_StoreView.size.height)];
    [ScrollView addSubview:_StoreView];
    
    //折线图
    view = [[GraphView alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY-20, kBaseWidth, kBaseHeight)];
   // view.alpha = 0;
    [Dibuview addSubview:view];
    
    
    rigthtBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, 90, 20)];
    rigthtBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [rigthtBtn setTitleColor:RGB(136, 180, 6) forState:UIControlStateNormal];
    [rigthtBtn setTitle:@"更多店铺" forState:UIControlStateNormal];
    [rigthtBtn addTarget:self action:@selector(OnclickMoreButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *BarMoreItem = [[UIBarButtonItem alloc] initWithCustomView:rigthtBtn];
    self.navigationItem.rightBarButtonItem = BarMoreItem;
    
    UIButton *LeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, 90, 20)];
    LeftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [LeftBtn setTitleColor:RGB(136, 180, 10) forState:UIControlStateNormal];
    [LeftBtn setTitle:@"折线图" forState:UIControlStateNormal];
    [LeftBtn addTarget:self action:@selector(OnclickGraphButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *GraphItem = [[UIBarButtonItem alloc] initWithCustomView:LeftBtn];
    self.navigationItem.leftBarButtonItem = GraphItem;
    
    
    _actionSheet = [[UIActionSheet alloc] initWithTitle:@"图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从手机相册选取",@"相机", nil];
    _actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    _ipc = [[UIImagePickerController alloc] init];
    _ipc.delegate = self;

    
    //头像
    HeadImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBaseOriginX+15, kBaseOriginY+97, 50, 50)];
    HeadImage.backgroundColor = [UIColor grayColor];
    HeadImage.userInteractionEnabled = YES;
    [self.view addSubview:HeadImage];
    

    _HeadImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBaseOriginX, kBaseOriginY, HeadImage.size.width, HeadImage.size.height)];
    [_HeadImageBtn addTarget:self action:@selector(OnclicHeadBtn) forControlEvents:UIControlEventTouchUpInside];
    _HeadImageBtn.backgroundColor = [UIColor clearColor];
    [HeadImage addSubview:_HeadImageBtn];

}

-(void) OnclickGraphButton {
    DLog(@"折线图");
    
    [UIView animateWithDuration:.3 animations:^{
        
        if (view.top == kBaseHeight) {
            view.top = kBaseHeight/2+10;
           Dibuview.alpha = .0;
           
        } else {
//            view.top = kBaseHeight+50;
//            view.top = kBaseHeight+300;
                    }
    }];

}

-(void) OnclicHeadBtn {
    
    NSLog(@"选择图片");
    
    [self selectImageButtonClick];
}

//选择图片
- (void)selectImageButtonClick{
    
    [_actionSheet showInView:self.view];
}

#pragma mark - actionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {   //相册选择
        _ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_ipc animated:YES completion:nil];
    }
    if (buttonIndex == 1) {  //相机拍摄
        _ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_ipc animated:YES completion:nil];
    }
}

#pragma mark - imagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    _image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        _isCamera = YES;
        UIImageWriteToSavedPhotosAlbum(_image, nil, nil, nil);
    }
    
    if (_isCamera) {  //如果相机拍摄
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *selectTimeStr = [formatter stringFromDate:_datePicker.date];
        _imgName = [NSString stringWithFormat:@"%@.jpg",selectTimeStr];
        NSLog(@"%@",_imgName);
    }else{
        NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
        ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
        {
            ALAssetRepresentation *representation = [myasset defaultRepresentation];
            NSString *fileName = [representation filename];
            _imgName = fileName;
        };
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:imageURL
                       resultBlock:resultblock
                      failureBlock:nil];
    }
    
    HeadImage.image = _image;
    _isCamera = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    _isCamera = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//----------------------
-(void) OnclickMoreButton  {
    
    MoreStoreViewController *MoreStreVC = [[MoreStoreViewController alloc] init];
    [self.navigationController pushViewController:MoreStreVC animated:YES];
    
}

#pragma mark UIScrollViewDelegate



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
