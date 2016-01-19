//
//  MoreView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
//

import UIKit

class MoreView: UIView {
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var model: GuessLikeModel? {
        didSet {
            titleLabel.text = model?.title
            adressLabel.text = model?.address
            if let imgStr = model?.imgs?.last {
                imageImageView.wxn_setImageWithURL(NSURL(string: imgStr)!, placeholderImage: UIImage(named: "quesheng")!)
            }
        }
    }

    class func moreViewWithGuessLikeModel(model: GuessLikeModel) -> MoreView{
        let moreView = NSBundle.mainBundle().loadNibNamed("MoreView", owner: nil, options: nil).last as! MoreView
        moreView.model = model
        return moreView
    }
}
