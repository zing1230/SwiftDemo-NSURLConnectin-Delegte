// Playground - noun: a place where people can play

import UIKit

let asd:String! = UIDevice.currentDevice().systemVersion;

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

    var image = UIImage.createImageWithColor(UIColor.redColor(), size: CGSizeMake(100, 20), corner: 2);







