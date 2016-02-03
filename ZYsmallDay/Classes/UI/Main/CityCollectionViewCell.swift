//
//  CityCollectionViewCell.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/13.
//  Copyright © 2015年 章宇. All rights reserved.
//  选择城市cell

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    private var textLabel: UILabel = UILabel()
    
    var cityName: String? {
        didSet {
            textLabel.text = cityName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel.textColor = UIColor.blackColor()
        textLabel.highlightedTextColor = UIColor.redColor()
        textLabel.textAlignment = .Center
        textLabel.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 重新布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = self.bounds
    }

}
