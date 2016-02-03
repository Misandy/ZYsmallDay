//
//  ClassifyCell.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/24.
//  Copyright © 2016年 章宇. All rights reserved.
//  分类首页的cell

import UIKit

class ClassifyCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classifyImageView: UIImageView!
    
    var model:EveryClassModel? {
        didSet {
        titleLabel.text = model!.name
            classifyImageView.wxn_setImageWithURL(NSURL(string: model!.img!)!, placeholderImage: UIImage(named: "quesheng")!)
        }
    }
    
}
