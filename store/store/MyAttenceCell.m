//
//  MyAttenceCell.m
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import "MyAttenceCell.h"

@implementation MyAttenceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0; i < 2; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 12+30*i, 50, 40)];
            if (i == 0) {
                label.text = @"签到：";
            }else{
                label.text = @"签退：";
            }
            label.font = [UIFont systemFontOfSize:15.0f];
            label.textColor = [UIColor blackColor];
            [self.contentView addSubview:label];
        }
        
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _signInButton.frame = CGRectMake(45, 20, 25, 25);
        [_signInButton setBackgroundImage:[UIImage imageNamed:@"checkbox_unselect.png"] forState:UIControlStateNormal];
        [_signInButton setBackgroundImage:[UIImage imageNamed:@"checkbox_select.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:_signInButton];
        
        _signOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _signOutButton.frame = CGRectMake(45, 50, 25, 25);
        [_signOutButton setBackgroundImage:[UIImage imageNamed:@"checkbox_unselect.png"] forState:UIControlStateNormal];
        [_signOutButton setBackgroundImage:[UIImage imageNamed:@"checkbox_select.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:_signOutButton];
        
        _startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 20, 160, 25)];
        [self addLabel:_startDateLabel];
        
        _endDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 50, 160, 25)];
        [self addLabel:_endDateLabel];
        
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(225, 35, 70, 30)];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        [self addLabel:_statusLabel];
        
    }
    return self;
}

- (void)addLabel:(UILabel *)label{
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:label];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
