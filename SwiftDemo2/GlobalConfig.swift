//
//  GlobalConfig.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-5.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import Foundation
import UIKit

enum GlobalConfig{
    
    static let IS_HIGHER_IOS_7:Bool = (NSString.stringWithString(UIDevice.currentDevice().systemVersion)).doubleValue >= (7.0) ? true : false
    
    static let IS_4_INCH_SCREEN:Bool = (UIScreen.mainScreen().bounds.size.height == 568) ? true : false;
    
    static let SCREEN_WIDTH:Float = UIScreen.mainScreen().bounds.size.width;
    
    static let SCREEN_HEIGHT:Float = (UIScreen.mainScreen().bounds.size.height - (IS_HIGHER_IOS_7 ? 0 : 20))
    
    static func COLOR_RGBA(r red:Float , g green:Float , b blue:Float , a alpha:Float) -> UIColor{
        return UIColor(red:red ,green:green ,blue:blue,alpha:alpha);
    }
    
    
}

