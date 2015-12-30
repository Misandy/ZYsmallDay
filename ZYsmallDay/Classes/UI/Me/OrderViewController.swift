//
//  OrderViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/15.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    init() {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的订单"
        view.backgroundColor = theme.SDBackgroundColor
        
    }
}
