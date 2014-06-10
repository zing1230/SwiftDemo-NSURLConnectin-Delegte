//
//  BridgeTools.m
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "BridgeTools.h"

@implementation BridgeTools

static BridgeTools * instance;
static dispatch_once_t once = 0;

+ (instancetype)shareInstance
{
    dispatch_once(&once, ^{
        instance = [[BridgeTools alloc] init];
    });
    return instance;
}

+ (CGSize)getSizeOfString:(UIFont *)font constroSize:(CGSize)size string:(NSString *)txt
{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGRect rect = [txt boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    return rect.size;
}


@end
