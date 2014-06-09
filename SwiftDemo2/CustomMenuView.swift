//
//  CustomMenuView.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-5.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

enum MENU_VIEW_TYPE: Int{
    case MENU_VIEW_TYPE_DEFAULT
    case MENU_VIEW_TYPE_ROOT
}

@objc protocol CustomMenuViewDelegate: NSObjectProtocol{
    @optional func menuSelected(menuView:CustomMenuView,atIndex:Int,lastSelectedIndex:Int);
}

class CustomMenuView: UIView {
    
    var normalImagesArr = Array<String>();
    var selectedImagesArr = Array<String>();
    var itemNames = Array<String>();
    var lastSelectedBtn = UIButton();
    
    var completionHandler:(CustomMenuView!,Int!,Int!) ->() = {(_,_,_) ->() in};
    var delegate:CustomMenuViewDelegate?;
    
    init(frame: CGRect,menuType:MENU_VIEW_TYPE!){
        super.init(frame: frame);
        self.backgroundColor = UIColor.blueColor();
    }
    
    //类的静态函数测试
    class func staticFunctionTest(input:String) ->String{
        println("inputString",input);
        return input;
    }
    
    func completionHandlerTest(input:String,tcompletionHandler:(output:String!,index:Int!)-> Void ){
        
        tcompletionHandler(output: "your input String is : " + input + " and Index Is : ",index: 999);
        
    }
    
    //#normalImagesArr 表示既是参数名又是参数
    func initMenuBtns(#normalImagesArr:Array<String>,selectedImagesArr:Array<String>,itemNames:Array<String>){
        
        self.normalImagesArr = normalImagesArr;
        self.selectedImagesArr = selectedImagesArr;
        self.itemNames = itemNames;
        
        var width = Float(GlobalConfig.SCREEN_WIDTH) / Float(self.itemNames.count);
        var height = CGRectGetHeight(self.frame);
        
        for (index,name) in enumerate(itemNames){
            var normalImageName = self.normalImagesArr[index];
            
            var selectedImageName = self.selectedImagesArr[index];
            
            var btn:(UIButton)! = UIButton(frame:CGRectMake(width * Float(index),0, width, height));
            btn.tag = index + 1000;
            btn.setTitle(name,forState:UIControlState.Normal);
            btn.addTarget(self,action:"menuBtnPressed:",forControlEvents:.TouchDown);
            btn.titleLabel.font = UIFont.boldSystemFontOfSize(12);
            btn.contentEdgeInsets = UIEdgeInsetsMake(27,11, 0, 10);
            btn.setBackgroundImage(UIImage(named:normalImageName),forState:UIControlState.Normal);
            btn.setBackgroundImage(UIImage(named:selectedImageName),forState:UIControlState.Highlighted);
            
            if index == 0{
                btn.setBackgroundImage(UIImage(named:selectedImageName),forState:UIControlState.Normal);
                self.lastSelectedBtn = btn;
            }
            
            
            self.addSubview(btn);
        }
    }
    
    func menuBtnPressed(sender:UIButton){
        var index:Int = sender.tag - 1000;
        var lastIndex:Int = self.lastSelectedBtn.tag - 1000;
        
        if index == lastIndex {return}
        
        sender.setBackgroundImage(UIImage(named:self.selectedImagesArr[index]),forState:UIControlState.Normal);
        self.lastSelectedBtn.setBackgroundImage(UIImage(named:self.normalImagesArr[lastIndex]),forState:UIControlState.Normal);
        
        var b:Bool! = self.delegate?.respondsToSelector("menuSelected!(menuView:,atIndex:,lastSelectedIndex:)");
        
        if(self.delegate? != nil && b){
            self.delegate?.menuSelected!(self,atIndex: index,lastSelectedIndex: lastIndex);
        }
        
        
        self.completionHandler(self,index,lastIndex);
        
        self.lastSelectedBtn = sender;
    }
    
    func addCompletionHandler(closure:(CustomMenuView!,Int!,Int!) ->()){
        self.completionHandler = closure;
        
    }
    
    func setSelectedIndex(aIndex:Int){
        //UIView 强转 UIButton
        var button:UIButton = self.viewWithTag(aIndex + 1000) as UIButton;
        self.menuBtnPressed(button);
    }
    
    func refreshMenuBtnTitle(menuTitles:Array<String>){
        if menuTitles.count != self.itemNames.count { return }
    }
    
    func menuSelected(completionHandler handler:(CustomMenuView!,Int!,Int!) ->()){
        
        
    }
}
