//
//  NSString+Trimming.m
//  Clock
//
//  Created by 苏孝禹  on 12-8-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/** 去空格 */
- (NSString *)trim {
    
    return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

- (CGSize)getSizeWithSizeWidth:(CGFloat)width font:(UIFont *)font
{
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize retSize = [self boundingRectWithSize:size
                                        options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}


@end
