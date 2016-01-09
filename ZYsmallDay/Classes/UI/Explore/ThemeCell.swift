//
//  ThemeCell.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// 探店美辑的cell

import UIKit

class ThemeCell: UITableViewCell {
    
    var model: ThemeModel? {
    
        didSet {
        
            titleLable.text = model!.title
            subTitleLable.text = model!.keywords
            backImageView.wxn_setImageWithURL(NSURL(string: model!.img!)!, placeholderImage: UIImage(named: "quesheng")!)
            
        }
    }
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    
    
    class func themeCellWithTableView(tableView: UITableView) -> ThemeCell {
        let identifier = "themeCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ThemeCell
        if cell == nil {
        cell = NSBundle.mainBundle().loadNibNamed("ThemeCell", owner: nil, options: nil).last as? ThemeCell
        }
        
        return cell!
    }
    
}
