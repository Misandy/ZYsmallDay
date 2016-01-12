//
//  EventCellTableViewCell.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
//  探店美天的自定义cell

import UIKit

class EventCellTableViewCell: UITableViewCell {
    
    var eventModel: EveryDay? {
    
        didSet {
            cellTitleLabel.text = eventModel!.events?.last?.feeltitle
            titleLabel.text = eventModel!.events?.last?.title
            subTltleLabel.text = eventModel!.events?.last?.address
            dayLable.text = eventModel?.day
            monthLabel.text = eventModel?.month
        
            
            if let imageURL = NSURL(string: eventModel!.events!.last!.imgs!.last!) {
//                imageImageView.wxn_setImageWithURL(imageURL, placeholderImage: UIImage(named: "quesheng")!)
                imageImageView.sd_setImageWithURL(imageURL, placeholderImage: UIImage(named: "quesheng"))
            }
        }
    }
    
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTltleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
    }
    
    
    class func eventCell(tableView: UITableView) -> EventCellTableViewCell {
        let identifier = "eventCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? EventCellTableViewCell
        if cell == nil {
        
            cell = NSBundle.mainBundle().loadNibNamed("EventCellTableViewCell", owner: nil, options: nil).last as? EventCellTableViewCell
        }
        
        return cell!
    }
}
