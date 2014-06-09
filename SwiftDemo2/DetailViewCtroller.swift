//
//  DetailViewCtroller.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-5.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit


protocol  DetailViewDelegate: NSObjectProtocol{
    func touchesEnded(viewController:DetailViewCtroller! , index: Int);
    func touchesBegan(viewController:DetailViewCtroller! , index: String);
}

class DetailViewCtroller: UIViewController ,NSURLConnectionDelegate,NSURLConnectionDataDelegate{
    
    let delegate:DetailViewDelegate
    
    var connecton:NSURLConnection!;
    var receivedData:NSMutableData!;
    var imagView:UIImageView!;
    var testCase:TestCase!
    
    init(delegate:DetailViewDelegate) {
        self.delegate = delegate;
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        self.title = "DetailViewCtroller";
        self.view.backgroundColor = GlobalConfig.COLOR_RGBA(r: 0,g: 255,b: 232,a: 1);
        var btn = UIButton.buttonWithType(.System) as UIButton;
        btn.frame = CGRectMake(20,80,280,40);
        btn.backgroundColor = UIColor.redColor();
        btn.setTitle("点击下载图片",forState:.Normal);
        btn.addTarget(self,action:"btnPressed:",forControlEvents:.TouchUpInside);
        self.view.addSubview(btn);
        
        
        testCase = TestCase(row:12,col:21);
        TestCase.printUserInput("zhulei",age:24);
        
        var menuView = CustomMenuView(frame: CGRectMake(20,200,280,100),
            menuType: MENU_VIEW_TYPE.MENU_VIEW_TYPE_DEFAULT);
        self.view.addSubview(menuView);
        
    }
    
    override func touchesBegan(touches:NSSet,withEvent:UIEvent){
        self.delegate.touchesBegan(self,index:"touchesBegan");
    }
    
    override func touchesEnded(touches:NSSet,withEvent:UIEvent){

        self.delegate.touchesEnded(self,index:123);
    }
    
    func btnPressed(sender:UIButton){
        
        var URL = NSURL.URLWithString("http://a.hiphotos.baidu.com/ting/pic/item/f7246b600c338744259a609e530fd9f9d62aa0f1.jpg");
        var request = NSURLRequest(URL:URL);
        
        self.connecton = NSURLConnection(request:request,delegate:self,startImmediately:true);
        self.receivedData = NSMutableData();
        self.connecton.start();
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!){
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        self.receivedData.length = 0;
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.receivedData.appendData(data);
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        
        var image = UIImage(data:self.receivedData);
        var width = image.size.width;
        var height = image.size.height;
        
        self.imagView = UIImageView(image:image);
        self.imagView.frame = CGRectMake(20,150,width * 0.5,height * 0.5);
        self.view.addSubview(self.imagView);
    }
    
}
