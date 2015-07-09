//
//  NSString+Trimming.h
//  Clock
//
//  Created by 苏孝禹 on 12-8-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** 去空格 */
- (NSString *) trim;

//根据指定的跨度 返回对应的文字高度 
- (CGSize)getSizeWithSizeWidth:(CGFloat)width font:(UIFont *)font;

@end
