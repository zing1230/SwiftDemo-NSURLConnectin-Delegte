//
//  CustomizeViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-10.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class CustomizeViewController: SecondLevelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavBarView(.NAV_BAR_TYPE_ROOT_VIEW);
        self.navBarView!.setTitle("理财定制");
        self.view.backgroundColor = UIColor.redColor();
        
    }
    
}
