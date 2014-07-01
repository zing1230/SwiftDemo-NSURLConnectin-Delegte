//
//  StringExt.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-10.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit
import Foundation

extension String{
    
    func getSizeOfString(font:UIFont,size:CGSize) ->CGSize{
        var str = self as NSString;
        var attribute = [NSFontAttributeName:font];
        var rect:CGRect = str.boundingRectWithSize(size,options:.UsesLineFragmentOrigin,attributes:attribute,context:nil);
        return rect.size;
    }
    
    func isValidateEmail() ->Bool{
        var emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        var emailTest = NSPredicate(format:emailRegex,nil);
        return emailTest.evaluateWithObject(emailTest);
    }
    
}
