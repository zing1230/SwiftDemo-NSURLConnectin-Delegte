//
//  CustomNavBarView.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

enum NAV_BAR_TYPE{
    case NAV_BAR_TYPE_ROOT_VIEW;
    case NAV_BAR_TYPE_SECOND_LEVEL_VIEW;
}


@objc protocol CustomNavBarViewDelegate:NSObjectProtocol{
    @optional func back(navBarView:CustomNavBarView);
}

class CustomNavBarView: UIView {

    var delegate:CustomNavBarViewDelegate? = nil;
    
    var nType:NAV_BAR_TYPE!;
    var backBtn:UIButton! = nil;
    var titleLabel:UILabel!;
    
    
    init(frame: CGRect,type:NAV_BAR_TYPE!) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1);
        nType = type;
        var offset:Float =  GlobalConfig.IS_HIGHER_IOS_7 ? 20 : 0;
        
        if (nType! == .NAV_BAR_TYPE_ROOT_VIEW){
            
   
        }else if(nType! == .NAV_BAR_TYPE_SECOND_LEVEL_VIEW){
            
            self.backBtn = UIButton(frame:CGRectMake(0, offset - 2, 50, 40));
            self.backBtn.setBackgroundImage(UIImage(named:"image_back_icon.png"),forState:UIControlState.Normal);
            self.backBtn.addTarget(self,action:"btnPressed:",forControlEvents:.TouchUpInside);
            self.addSubview(self.backBtn);
            
        }

        self.titleLabel = UILabel(frame:CGRectZero);
        self.titleLabel.backgroundColor = UIColor.clearColor();
        self.titleLabel.textColor = UIColor.whiteColor();
        self.titleLabel.font = UIFont.boldSystemFontOfSize(21);
        self.titleLabel.textAlignment = .Center;
        self.addSubview(self.titleLabel);
    }
    
    func btnPressed(sender:UIButton){
        self.delegate?.back?(self);
        
    }
    
    func setTitle(title:String){
        
        //调用OC的函数
//        var size = BridgeTools.getSizeOfString(UIFont.boldSystemFontOfSize(21),constroSize:CGSizeMake(CGRectGetWidth(self.frame) - 100, 45),string:title as NSString);
        
//        getSizeOfString(font:UIFont,size:CGSize) ->CGSize
        var size = title.getSizeOfString(UIFont.boldSystemFontOfSize(21),size: CGSizeMake(CGRectGetWidth(self.frame) - 100, 45));
        
        var frame:CGRect!;
        
        if(GlobalConfig.IS_HIGHER_IOS_7){
            frame = CGRectMake((CGRectGetWidth(self.frame) - size.width)/2, 20, size.width, 40);
        }else{
            frame = CGRectMake((CGRectGetWidth(self.frame) - size.width)/2, 0, size.width, 40);
        }

        self.titleLabel.frame = frame;
        self.titleLabel.text = title;

    }

    
}
