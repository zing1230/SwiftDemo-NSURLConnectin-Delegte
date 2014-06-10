//
//  ConfigData.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

struct statics{
    static var instance:ConfigData? = nil;
    static var once:dispatch_once_t = 0;
}

class ConfigData {
    var test:String?;
    class func shareInstance() ->ConfigData!{
        dispatch_once(&statics.once, {
            statics.instance = ConfigData();
        })
        return statics.instance;
    }
    
    
}
