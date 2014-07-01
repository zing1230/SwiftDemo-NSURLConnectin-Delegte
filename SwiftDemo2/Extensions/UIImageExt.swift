//
//  UIImageExt.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-11.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

extension UIImage {
    class func createImageWithColor(color:UIColor,size:CGSize,corner:CGFloat) ->UIImage{
        var view:UIView = UIView(frame:CGRectMake(0, 0, size.width * 2, size.height * 2));
        view.backgroundColor = color;
        view.layer.cornerRadius = corner;
        UIGraphicsBeginImageContext(view.bounds.size);
        view.layer.renderInContext(UIGraphicsGetCurrentContext());
        var image:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }

}
