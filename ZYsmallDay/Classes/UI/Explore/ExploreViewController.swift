//
//  ExploreViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/12.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

public let SD_RefreshImage_Height: CGFloat = 40
public let SD_RefreshImage_Width: CGFloat = 35

class ExploreViewController: MainViewController {
    
    private var backgroundScrollView: UIScrollView!
    private var doubleTextView: DoubleTextView!
//    private var everyDays: EveryDays?
//    private var albumTableView: MainTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化导航条内容
//        setNav()
        
    }
    
    private func setScrollView() {
    
        self.automaticallyAdjustsScrollViewInsets = false
        backgroundScrollView = UIScrollView(frame: CGRectMake(0, 0, APPWidth, AppHeight - NavigationH - 49))
        backgroundScrollView.backgroundColor = theme.SDBackgroundColor
        backgroundScrollView.contentSize = CGSizeMake(APPWidth * 2.0, 0)
        backgroundScrollView.showsHorizontalScrollIndicator = false
        backgroundScrollView.showsVerticalScrollIndicator = false
        backgroundScrollView.pagingEnabled = true
//        backgroundScrollView.delegate = self
        view.addSubview(backgroundScrollView)
    }
    
//    private func setNav() {
//    
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "附近", titleColor: UIColor.blackColor(), target: self, action: "nearClick")
//        
//        doubleTextView = DoubleTextView(leftText: "美天", rigthText: "美辑");
//        doubleTextView.frame = CGRectMake(0, 0, 120, 44)
//        doubleTextView.delegate = self
//        navigationItem.titleView = doubleTextView
//        
//        
//    }
}