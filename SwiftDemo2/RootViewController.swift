//
//  RootViewController.swift
//  SwiftDemo2
//
//  Created by Sidney on 14-6-4.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,CustomMenuViewDelegate
{
    
    var curActiveViewCtrller:UINavigationController?;
    
    var homeViewCtrller:HomeViewController?;
    var producViewCtrller:ProductViewController?;
    var customizeViewCtrller:CustomizeViewController?
    var assetViewCtrller:AssetViewController?;
    
    var navgationForHomeViewCtrller:UINavigationController?;
    var navgationForProducViewCtrller:UINavigationController?;
    var navgationForCustomizeViewCtrller:UINavigationController?;
    var navgationForAssetsViewCtrller:UINavigationController?;
    
    var childFrame:CGRect!;
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)
    {
        super.init(nibName: nibNameOrNil,bundle: nibBundleOrNil);
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Swift";
        self.view.backgroundColor = UIColor.magentaColor();
        self.initMenuView();
        
        childFrame = CGRectMake(0,0,GlobalConfig.SCREEN_WIDTH,GlobalConfig.SCREEN_HEIGHT - GlobalConfig.TAB_BAR_HEIGHT);
        
        enterIntoHomeViewCtrller();
                
        //单例测试
        var test = ConfigData.shareInstance().test;
        println(test);
        
        ConfigData.shareInstance().test = "单例测试"
        test = ConfigData.shareInstance().test;
        println(test);
        
    }
    
    
    func initMenuView(){
        
        var menuNames = ["首页","产品列表","理财定制","我的资产"];
        var menuImgs = ["menu_icon_1_2.png","menu_icon_2_2.png","menu_icon_3_2.png","menu_icon_4_2.png"];
        var selectedmenuImgs = ["menu_icon_1_1.png","menu_icon_2_1.png","menu_icon_3_1.png","menu_icon_4_1.png"];
        
        var menuView = CustomMenuView(frame:CGRectMake(0,GlobalConfig.SCREEN_HEIGHT - GlobalConfig.TAB_BAR_HEIGHT,GlobalConfig.SCREEN_WIDTH,GlobalConfig.TAB_BAR_HEIGHT),menuType: MENU_VIEW_TYPE.MENU_VIEW_TYPE_DEFAULT);
        
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
    }
    
    func menuSelected(menuView:CustomMenuView,atIndex:Int,lastSelectedIndex:Int)
    {
        println(menuView,atIndex,lastSelectedIndex);
        switch atIndex{
        case 0:
            enterIntoHomeViewCtrller();
            break;
        case 1:
            enterIntoProducViewCtrller();
            break;
        case 2:
            enterIntoCustomizeViewCtrller();
            break;
        case 3:
            enterIntoAssetViewCtrller();
            break;
        default:
            
            break;
        }
        
    }
    
    func enterIntoHomeViewCtrller(){
        if(!homeViewCtrller){
            homeViewCtrller = HomeViewController();
            navgationForHomeViewCtrller = UINavigationController(rootViewController:homeViewCtrller);
            navgationForHomeViewCtrller!.navigationBarHidden = true;

        }
        swithViewCtrllerToShow(navgationForHomeViewCtrller);
    }
    
    func enterIntoProducViewCtrller(){
        if(!producViewCtrller){
            producViewCtrller = ProductViewController();
            navgationForProducViewCtrller = UINavigationController(rootViewController:producViewCtrller);
            navgationForProducViewCtrller!.navigationBarHidden = true;

        }
        swithViewCtrllerToShow(navgationForProducViewCtrller);
    }
    
    func enterIntoCustomizeViewCtrller(){
        if(!customizeViewCtrller){
            customizeViewCtrller = CustomizeViewController();
            navgationForCustomizeViewCtrller = UINavigationController(rootViewController:customizeViewCtrller);
            navgationForCustomizeViewCtrller!.navigationBarHidden = true;

        }
        swithViewCtrllerToShow(navgationForCustomizeViewCtrller);
    }
    
    func enterIntoAssetViewCtrller(){
        if(!assetViewCtrller){
            assetViewCtrller = AssetViewController();
            navgationForAssetsViewCtrller = UINavigationController(rootViewController:assetViewCtrller);
            navgationForAssetsViewCtrller!.navigationBarHidden = true;

        }
        swithViewCtrllerToShow(navgationForAssetsViewCtrller);
    }
    
    func swithViewCtrllerToShow(viewCtrller:UINavigationController!){
        
        if (curActiveViewCtrller && viewCtrller != curActiveViewCtrller) {
            viewCtrller.view.frame = childFrame;
            
            self.view.addSubview(viewCtrller.view);
            curActiveViewCtrller?.view.removeFromSuperview();
            
        }else if(!curActiveViewCtrller){
            viewCtrller.view.frame = childFrame;
            self.view.addSubview(viewCtrller.view);
        }
        if (!GlobalConfig.IS_HIGHER_IOS_7){ self.view.layoutIfNeeded()};
        
        curActiveViewCtrller = viewCtrller
        
    }
    

    
}
