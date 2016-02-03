//
//  DetailCell.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/9.
//  Copyright © 2016年 章宇. All rights reserved.
//  分类详情cell

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var disLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var disImageV: UIImageView!
    
    var model: EventModel? {
        didSet {
            titleLabel.text = model!.title
            subTitleLabel.text = model!.address
            if let imsStr = model?.imgs?.last {
                backImageView.wxn_setImageWithURL(NSURL(string: imsStr)!, placeholderImage: UIImage(named: "quesheng")!)
            }
            
            if model!.isShowDis {
                disImageV.hidden = false
                disLabel.hidden = false
                disLabel.text = model!.distanceForUser
            } else {
                disLabel.hidden = true
                disImageV.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        self.selectionStyle = .None
    }
    
}
