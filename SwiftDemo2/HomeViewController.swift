//
//  HomeViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-10.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class HomeViewController: SecondLevelViewController ,UITableViewDelegate , UITableViewDataSource ,DetailViewDelegate
{
    var tableView:UITableView?;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavBarView(.NAV_BAR_TYPE_ROOT_VIEW);
        self.navBarView!.setTitle("首页");
        self.view.backgroundColor = UIColor.greenColor();
        self.initTableView();

    }
    
    func initTableView(){
        self.tableView = UITableView(frame:CGRectMake(0,GlobalConfig.NAV_BAR_HEIGHT,320,CGRectGetHeight(self.view.frame) - GlobalConfig.TAB_BAR_HEIGHT - GlobalConfig.NAV_BAR_HEIGHT), style:.Plain);
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
        var detailViewCtrller = DetailViewCtroller(nibName: nil,bundle: nil);
        detailViewCtrller.delegate = self;
        self.navigationController.pushViewController(detailViewCtrller,animated:true);
    }

    
    func touchesEnded(viewController:DetailViewCtroller! , index: Int){
        println(__FUNCTION__, __LINE__,index);
        
        
    }
    
    func touchesBegan(viewController:DetailViewCtroller! , index: String){
        println(__FUNCTION__, __LINE__,index);
    }
    
}
