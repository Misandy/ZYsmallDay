//
//  MainTabBarController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/11.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化所有子控制器
    private func setUpAllChildViewController() {
    
        //探店
        tabBaraAddChildViewController(vc: ExploreViewController(), title: "探店", imageName: "recommendation_1", selectedImageName: "recommendation_2")

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
