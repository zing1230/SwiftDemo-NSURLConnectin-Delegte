//
//  RootViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-4.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class RootViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate,DetailViewDelegate
{

    
    var tableView:UITableView?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift";
        self.view.backgroundColor = UIColor.redColor();
        self.initTableView();
    
    }
    
    func initTableView(){
        self.tableView = UITableView(frame:CGRectMake(0,0,320,CGRectGetHeight(self.view.frame)), style:.Plain);
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView);
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return 20;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let identifier = "cell";
        var cell = tableView!.dequeueReusableCellWithIdentifier(identifier,forIndexPath:indexPath)  as UITableViewCell
        if(cell === nil){
            cell = UITableViewCell(style:.Default,reuseIdentifier:identifier);
        }
        var row = indexPath.row;
        
        cell.textLabel.text = String(row + 1);

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
