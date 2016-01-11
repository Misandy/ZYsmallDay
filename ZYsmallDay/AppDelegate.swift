//
//  AppDelegate.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/11.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        setKeyWindow()
        
        setAppAppearance()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMianViewController", name: SD_ShowMianTabbarController_Notification, object: nil)

        
        return true
    }
    
    private func setKeyWindow() {
    
        window = UIWindow(frame: MainBounds)
        
        window?.rootViewController = showLeadpage()
        
        window?.makeKeyAndVisible()
    }
    
    // 分享设置
    func setAppAppearance() {
    
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Selected)
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Normal)
        
        // 设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        // 设置导航titleview字体
        navAppearance.translucent = false
        navAppearance.titleTextAttributes = [NSFontAttributeName : theme.SDNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()]
        
        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSFontAttributeName : theme.SDNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
        
    }
    
    //MARK: 引导页设置
    private func showLeadpage() -> UIViewController {
    
        let versionStr = "CFBundleShortVersionString"
        let currentVersion = NSBundle.mainBundle().infoDictionary![versionStr] as! String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionStr) as? String) ?? "" //判断??左边表达式是否为null，如是null则取右边表达式的值，否则就取左边表达式的值
        
        if currentVersion.compare(oldVersion) == NSComparisonResult.OrderedDescending {
        
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: versionStr)
            NSUserDefaults.standardUserDefaults().synchronize()
            return LeadpageViewController()
        }
        
        return MainTabBarController()
    }
    
    func showMianViewController() {
        let mainTabBarVC = MainTabBarController()
        self.window!.rootViewController = mainTabBarVC
        let nav = mainTabBarVC.viewControllers![0] as? MainNavigationController
        (nav?.viewControllers[0] as! MainViewController).pushcityView()
    }

}

