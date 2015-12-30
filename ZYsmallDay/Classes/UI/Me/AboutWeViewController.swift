//
//  AboutWeViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/15.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class AboutWeViewController: UIViewController {
    
    init() {
    
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
    
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "关于我们"


    }
}
