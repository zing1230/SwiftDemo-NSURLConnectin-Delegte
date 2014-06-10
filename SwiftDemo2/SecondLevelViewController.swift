//
//  SecondLevelViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-6.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class SecondLevelViewController: UIViewController ,CustomNavBarViewDelegate{

    var navBarView:CustomNavBarView?;
    
    
//    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)
//    {
//        super.init(nibName: nibNameOrNil,bundle: nibBundleOrNil);
//        
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func initNavBarView(barType:NAV_BAR_TYPE){
        navBarView = CustomNavBarView(frame:CGRectMake(0, 0, GlobalConfig.SCREEN_WIDTH, GlobalConfig.NAV_BAR_HEIGHT), type:barType);
        navBarView!.delegate = self;
        self.view.addSubview(navBarView);
    }
    
    func back(navBarView:CustomNavBarView)
    {
        self.navigationController.popViewControllerAnimated(true);
    }

}

