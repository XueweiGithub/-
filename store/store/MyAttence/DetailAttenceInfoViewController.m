//
//  DetailAttenceInfoViewController.m
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import "DetailAttenceInfoViewController.h"

@interface DetailAttenceInfoViewController ()

@end

@implementation DetailAttenceInfoViewController

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
    
    self.title = @"考勤详情";
    
    [self addButtonItemWithImage:GOBACK_IMAGE selectedImage:nil title:nil frame:CGRectMake(0, 0, 25, 25) selector:@selector(goBackButtonClick) isLeft:YES];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, [DeviceManager currentScreenHeight]-64-20)];
    backView.backgroundColor = [UIColor lightGrayColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 5.0;
    [self.view addSubview:backView];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"签到设备：",@"签到时间：",@"签退时间：", nil];
    NSArray *dataArray = [NSArray arrayWithObjects:self.model.summary,self.model.startDate,self.model.endDate, nil];
    NSLog(@"%@",dataArray);
    UIFont *font = [UIFont systemFontOfSize:15.0f];
    CGSize size;
    NSString *text;
    CGRect rect;
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+(20+20)*i, 90, 30)];
        label.text = [titleArray objectAtIndex:i];
        label.textColor = [UIColor blackColor];
        label.font = font;
        [backView addSubview:label];
        UILabel *dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+(10+30)*i, 160, 30)];
        dataLabel.text = [dataArray objectAtIndex:i];
        dataLabel.backgroundColor = [UIColor whiteColor];
        dataLabel.layer.masksToBounds = YES;
        dataLabel.layer.cornerRadius = 5.0;
        dataLabel.font = font;
        [backView addSubview:dataLabel];
    }
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+(20+20)*3, 90, 30)];
    addressLabel.text = @"签到地址：";
    addressLabel.textColor = [UIColor blackColor];
    addressLabel.font = font;
    [backView addSubview:addressLabel];
    
    UILabel *addressDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+(10+30)*3+6, 160, 0)];
    [addressDataLabel setFont:font];
    [addressDataLabel setNumberOfLines:0];
    [addressDataLabel setBackgroundColor:[UIColor clearColor]];
    text = self.model.address;
    size = [text sizeWithFont:font constrainedToSize:CGSizeMake(160.0f, 400.0f) lineBreakMode:NSLineBreakByCharWrapping];
    rect = addressDataLabel.frame;
    rect.size = size;
    [addressDataLabel setFrame:rect];
    [addressDataLabel setText:text];
    [backView addSubview:addressDataLabel];
    
    UILabel *addressBackLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, addressDataLabel.frame.origin.y+addressDataLabel.frame.size.height+10, 90, 30)];
    addressBackLabel.text = @"签退地址：";
    addressBackLabel.textColor = [UIColor blackColor];
    addressBackLabel.font = font;
    [backView addSubview:addressBackLabel];
    
    UILabel *addressBackDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, addressDataLabel.frame.origin.y+addressDataLabel.frame.size.height+16, 160, 0)];
    [addressBackDataLabel setFont:font];
    [addressBackDataLabel setNumberOfLines:0];
    [addressBackDataLabel setBackgroundColor:[UIColor clearColor]];
    text = self.model.addressBack;
    size = [text sizeWithFont:font constrainedToSize:CGSizeMake(160.0f, 400.0f) lineBreakMode:NSLineBreakByCharWrapping];
    rect = addressBackDataLabel.frame;
    rect.size = size;
    [addressBackDataLabel setFrame:rect];
    [addressBackDataLabel setText:text];
    [backView addSubview:addressBackDataLabel];
    
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
