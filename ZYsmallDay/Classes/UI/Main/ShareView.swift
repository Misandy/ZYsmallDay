//
//  ShareView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/16.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class ShareView: UIView {
    
    weak var shareVC: UIViewController?
    var shareModel: ShareModel?
    
    private lazy var coverBtn: UIButton! = {
    
        let coverBtn = UIButton(frame: MainBounds)
        coverBtn.backgroundColor = UIColor.blackColor()
        coverBtn.alpha = 0.2
        coverBtn.addTarget(self, action: "coverClick", forControlEvents: UIControlEvents.TouchUpInside)
        return coverBtn
    }()
    
    class func shareViewFromXib() -> ShareView {
        let shareV = NSBundle.mainBundle().loadNibNamed("ShareView", owner: nil, options: nil).last as! ShareView
        shareV.frame = CGRectMake(0, AppHeight, APPWidth, theme.ShareViewHeight)
        return shareV
    }

    @IBAction func weChat(sender: UIButton) {
        
        
    }

    @IBAction func friends(sender: UIButton) {
        
        
    }
    
    @IBAction func sina(sender: UIButton) {
        
        
    }
    
    @IBAction func cancle(sender: UIButton) {
        
        
    }
    
    func showShareView(rect: CGRect) {
    
        self.superview?.insertSubview(coverBtn, belowSubview: self)
    }
}
