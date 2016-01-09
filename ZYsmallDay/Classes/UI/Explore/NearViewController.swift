//
//  NearViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// 附近控制器

import UIKit

class NearViewController: UIViewController {

    // 懒加载对象
    private var nears: DetailModel?
    
    private lazy var backView:UIView = {
    
        let backView = UIView(frame: self.view.bounds)
        backView.backgroundColor = theme.SDBackgroundColor
        return backView
    }()
    
    private lazy var nearTableView: MainTableView = {
    
        let tableV = MainTableView(frame: MainBounds, style: .Plain, dataSource: self, delegate: self)
        tableV.rowHeight = DetailCellHeight
        tableV.registerNib(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: SD_DetailCell_Identifier)
        
        let diyHeader = SDRefreshHeader(refreshingTarget: self, refreshingAction: "pullLoadDatas")
        diyHeader.gifView!.frame = CGRectMake((AppWidth - SD_RefreshImage_Width) * 0.5, 10, SD_RefreshImage_Width, SD_RefreshImage_Height)
        tableV.mj_header = diyHeader
        return tableV
    }()
    
//    private lazy var mapView: WNXMapView = WNXMapView(frame: self.view.bounds)
    
//    private var rightItem: UIBarButtonItem = {
//        
//        let right = UIBarButtonItem(imageName: "map_2-1", highlImageName: "map_2", selectedImage: "list_1", targer: self, action: "leftItemClick:")
//        return right
//    }()
}



    //MARK:- TableView代理方法
    extension NearViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if nears?.list?.count > 0 {
//                navigationItem.rightBarButtonItem = rightItem
            } else {
                navigationItem.rightBarButtonItem = nil
            }
            
            return nears?.list?.count ?? 0
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(SD_DetailCell_Identifier) as? DetailCell
            cell!.model = nears!.list![indexPath.row] as EventModel
            return cell!
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let eventModel = nears!.list![indexPath.row] as EventModel
            let detailVC = EventViewController()
            detailVC.model = eventModel
            navigationController!.pushViewController(detailVC, animated: true)
        }
}