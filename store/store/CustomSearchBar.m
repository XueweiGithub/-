//
//  CustomSearchBar.m
//  Exhibitors
//
//  Created by nwwl on 13-12-14.
//  Copyright (c) 2013年 nwwl. All rights reserved.
//

#import "CustomSearchBar.h"

@implementation CustomSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
    
    double version = [[[UIDevice currentDevice] systemVersion]doubleValue];
    if (version <7)
    {
        
        //去掉search背景图
        UITextField *searchField;
        NSUInteger numViews = [self.subviews count];
        for(int i = 0; i < numViews; i++) {
            if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
                searchField = [self.subviews objectAtIndex:i];
            }
        }
        if(!(searchField == nil)) {
            searchField.textColor = [UIColor blackColor];
            searchField.backgroundColor = [UIColor whiteColor];
            [searchField.leftView setHidden:NO];
            [searchField setBackground: [UIImage imageNamed:@"0"] ];
            searchField.layer.borderColor = [UIColor colorWithRed:176.0/255.0f green:176.0/255.0f blue:176.0/255.0f alpha:1].CGColor;
            searchField.layer.borderWidth = 1;
            searchField.layer.cornerRadius = 6;
            
        }
        for (UIView *subview in self.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
                UIImageView *image = [[UIImageView alloc]init];
                image.backgroundColor = [UIColor whiteColor];
                
                break;
            }
            
        }
    }
    
    else
    {
        //去掉search背景图0
        UITextField *searchField;
        UIView *view = [self.subviews objectAtIndex:0];
        NSUInteger numViews = [view.subviews count];
        for(int i = 0; i < numViews; i++) {
            if([[view.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
                searchField = [view.subviews objectAtIndex:i];
                searchField.layer.borderWidth = 1;
                searchField.layer.cornerRadius = 6;
                searchField.layer.borderColor = [UIColor colorWithRed:176.0/255.0f green:176.0/255.0f blue:176.0/255.0f alpha:1].CGColor;
            }
        }
        for (UIView *subview in view.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
                UIImageView *image = [[UIImageView alloc]init];
                image.backgroundColor = [UIColor redColor];
                [view insertSubview:image atIndex:0];
                break;
            }
            
        }
        
        
    }
    
    [super layoutSubviews];
}



@end
