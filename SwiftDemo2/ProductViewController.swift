//
//  ProductViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-10.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class ProductViewController: SecondLevelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavBarView(.NAV_BAR_TYPE_ROOT_VIEW);
        self.navBarView!.setTitle("产品列表");
        self.view.backgroundColor = UIColor.whiteColor();
        
        var checkView = CustomCheckView(frame:CGRectMake(90, 90, 18, 15))
        checkView.setOn(true);
        view.addSubview(checkView);

        
    }
    
}
