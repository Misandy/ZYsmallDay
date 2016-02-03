//
//  ExploreBottomView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/18.
//  Copyright © 2016年 章宇. All rights reserved.
//  体验详情viewcontroller动态加载的异步提醒view

import UIKit

class ExploreBottomView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var remindBtn: UIButton!
    @IBOutlet weak var bottomLineView: UIView!
    
    class func exploreBottomViewFromXib(title: String, subTitle: String, target: AnyObject, action: Selector, showBtn: Bool, showArrow: Bool) -> ExploreBottomView {
        
        let expView = NSBundle.mainBundle().loadNibNamed("ExploreBottomView", owner: nil, options: nil).last as! ExploreBottomView
        expView.titleLabel.text = title
        expView.subTitleLabel.text = subTitle
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        expView.addGestureRecognizer(tap)
        expView.remindBtn.hidden = !showBtn
        expView.arrowImageView.hidden = !showArrow
        expView.backgroundColor = UIColor.clearColor()
        expView.remindBtn.enabled = false
        expView.userInteractionEnabled = true
        return expView
    }
}
