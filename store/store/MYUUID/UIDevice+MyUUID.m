//
//  UIDevice+MyUUID.m
//  ShandongLichen
//
//  Created by 元弘盛业 on 15-4-7.
//  Copyright (c) 2015年 YHSY. All rights reserved.
//

#import "UIDevice+MyUUID.h"
#import "MyKeychainItemWrapper.h"

@implementation UIDevice (MyUUID)

- (NSString *)myUUID
{
    MyKeychainItemWrapper *keychainItem = [[MyKeychainItemWrapper alloc]
                                           initWithIdentifier:@"UUID"
                                           accessGroup:nil];
    NSString *strUUID = [keychainItem objectForKey:(__bridge id)kSecValueData];
    if ([strUUID isEqualToString:@""])
    {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        [keychainItem setObject:strUUID forKey:(__bridge id)kSecValueData];
        CFAutorelease(uuidRef);
    }
    return strUUID;
}

@end
