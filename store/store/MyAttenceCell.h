//
//  MyAttenceCell.h
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAttenceCell : UITableViewCell

@property (nonatomic,retain) UIButton *signInButton;
@property (nonatomic,retain) UIButton *signOutButton;
@property (nonatomic,retain) UILabel *startDateLabel;
@property (nonatomic,retain) UILabel *endDateLabel;
@property (nonatomic,retain) UILabel *statusLabel;

@end
