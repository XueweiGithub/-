//
//  MyAttenceModel.h
//  元弘盛业
//
//  Created by 元弘盛业 on 14-9-16.
//  Copyright (c) 2014年 YHSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAttenceModel : NSObject

@property (nonatomic,copy) NSString *startDate;
@property (nonatomic,copy) NSString *endDate;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *addressBack;
@property (nonatomic,copy) NSString *deviceNumber;
@property (nonatomic,copy) NSString *deviceBack;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *summary;

@end
