//
//  CustomCheckView.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

@objc protocol CustomCheckViewDelegate:NSObjectProtocol{

    @optional func selectCheckBox(checkView:CustomCheckView ,isOn:Bool);
    
}


class CustomCheckView: UIView {
    
    var on:Bool!;
    
    var selectedImage:UIImage!;
    var unSelectedImage:UIImage!;
    var isSelectedBtn:UIButton!;
    
    var delegate:CustomCheckViewDelegate?;
    
    init(frame: CGRect) {
        super.init(frame: frame);
        
        var selectedImageName = "check_on.png";
        var unSelectedImageName = "check_off.png";
        
        self.selectedImage = UIImage(named : selectedImageName);
        self.unSelectedImage = UIImage(named : unSelectedImageName);
        
        self.isSelectedBtn = UIButton(frame:self.bounds);
        self.isSelectedBtn.setBackgroundImage(unSelectedImage,forState:.Normal);
        self.isSelectedBtn.addTarget(self,action:"isSelectedBtnPressed:",forControlEvents:.TouchUpInside);
        self.addSubview(self.isSelectedBtn);
    }
    
    func setOn(isOn:Bool){
        self.on = isOn;
        if self.on {
            self.isSelectedBtn.setBackgroundImage(selectedImage,forState:.Normal);
                self.isSelectedBtn.selected = false;
        }
    }
    
    func isSelectedBtnPressed(sender:UIButton!){
        
        if (!sender.selected) {
            sender.setBackgroundImage(unSelectedImage,forState:.Normal);
            sender.selected = true;
        }else {
            sender.setBackgroundImage(selectedImage,forState:.Normal);
            sender.selected = false;
        }
        on = sender.selected;
        self.delegate?.selectCheckBox?(self, isOn: on);
    }
}
