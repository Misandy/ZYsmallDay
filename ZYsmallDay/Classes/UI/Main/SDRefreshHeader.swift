//
//  SDRefreshHeader.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// DIY 自己的下拉刷新动画

import UIKit

class SDRefreshHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        stateLabel!.hidden = true
        lastUpdatedTimeLabel!.hidden = true
        
        let idleImages = NSMutableArray()
        let idImage = UIImage(named: "wnx00")
        idleImages.addObject(idImage!)
        setImages(idleImages as [AnyObject], forState: MJRefreshState.Idle)
        
        let refreshingImages = NSMutableArray()
        let refreshingImage = UIImage(named: "wnx00")!
        refreshingImages.addObject(refreshingImage)
        setImages(refreshingImages as [AnyObject], forState: MJRefreshState.Pulling)
        
        let refreshingStartImages = NSMutableArray()
        for i in 0...92 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            refreshingStartImages.addObject(image!)
        }
        setImages(refreshingStartImages as [AnyObject], forState: MJRefreshState.Refreshing)
        
    }
    
}

