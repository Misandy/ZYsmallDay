//
//  ClassifyViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/13.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class ClassifyViewController: MainViewController {
    var imageImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        imageImageView = UIImageView()
        imageImageView.frame = UIScreen.mainScreen().bounds;
        if let imageURL = NSURL(string:"http://pic.huodongjia.com/event/2015-05-06/event121380.jpg") {
            imageImageView.wxn_setImageWithURL(imageURL, placeholderImage: UIImage(named: "quesheng")!)
        }
        self.view.addSubview(imageImageView)
    }
    
    
}
