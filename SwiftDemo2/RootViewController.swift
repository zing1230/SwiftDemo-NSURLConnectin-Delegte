//
//  RootViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-4.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class RootViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate,DetailViewDelegate,CustomMenuViewDelegate
{
    
    
    var tableView:UITableView?;
    
    let menuHeight:Float = 47;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift";
        self.view.backgroundColor = UIColor.redColor();
        self.initTableView();
        
        
        var menuNames = ["首页","产品列表","理财定制","我的资产"];
        var menuImgs = ["menu_icon_1_2.png","menu_icon_2_2.png","menu_icon_3_2.png","menu_icon_4_2.png"];
        var selectedmenuImgs = ["menu_icon_1_1.png","menu_icon_2_1.png","menu_icon_3_1.png","menu_icon_4_1.png"];
        
        
        var menuView = CustomMenuView(frame:CGRectMake(0,GlobalConfig.SCREEN_HEIGHT - menuHeight,GlobalConfig.SCREEN_WIDTH,menuHeight),menuType: MENU_VIEW_TYPE.MENU_VIEW_TYPE_DEFAULT);

        //delegate 返回参数
        menuView.delegate = self;
        menuView.initMenuBtns(normalImagesArr: menuImgs,selectedImagesArr:selectedmenuImgs,itemNames:menuNames);
        
        self.view.addSubview(menuView);
        
        //Closure 返回参数
        menuView.addCompletionHandler({(menuView:CustomMenuView!,atIndex:Int!,lastSelectedIndex:Int!) -> ()in
            
            println("addCompletionHandler",menuView,atIndex,lastSelectedIndex);
            
            })
        //静态函数测试
        var testString = CustomMenuView.staticFunctionTest("我是朱檑");
        
        //Closure 测试返回多参数
        menuView.completionHandlerTest("闭包测试函数",tcompletionHandler:{(output:String!,index:Int!) in
            println(output,index);
            
            
            })
        
//        var view = CustomView(frame:CGRectMake(0,20,320,300));
//        self.view.addSubview(view);
        
    }
    
    func menuSelected(menuView:CustomMenuView,atIndex:Int,lastSelectedIndex:Int)
    {
        println(menuView,atIndex,lastSelectedIndex);
        
    }
    
    
    func initTableView(){
        self.tableView = UITableView(frame:CGRectMake(0,0,320,CGRectGetHeight(self.view.frame) - menuHeight), style:.Plain);
        self.tableView!.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self
        self.view.addSubview(self.tableView);
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return 20;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let identifier = "cell";
        
        var cell = tableView!.dequeueReusableCellWithIdentifier(identifier,forIndexPath:indexPath)  as CustomTableViewCell
        
        if(cell === nil){
            cell = CustomTableViewCell(style:.Default,reuseIdentifier:identifier);
        }
        var row = indexPath.row;
        cell.pNameLabel.text = "123";
        
        return cell;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var row = indexPath.row;
        println("row : \(row)");
        
        //        func pushViewController(viewController: UIViewController!, animated: Bool) // Uses a horizontal slide transition. Has no effect if the view controller is already in the stack.
        
        var detailViewCtrller = DetailViewCtroller(delegate: self);
        self.navigationController.pushViewController(detailViewCtrller,animated:true);
    }
    
    func touchesEnded(viewController:DetailViewCtroller! , index: Int){
        println(__FUNCTION__, __LINE__,index);
    }
    
    func touchesBegan(viewController:DetailViewCtroller! , index: String){
        println(__FUNCTION__, __LINE__,index);
    }
    
}
