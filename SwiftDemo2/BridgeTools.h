//
//  BridgeTools.h
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BridgeTools : NSObject


+ (instancetype)shareInstance;

+ (CGSize)getSizeOfString:(UIFont *)font constroSize:(CGSize)size string:(NSString *)txt;


@end
