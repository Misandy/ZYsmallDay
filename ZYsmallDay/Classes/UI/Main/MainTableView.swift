//
//  MainTableView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
//  对TableView共同代码的抽取

import UIKit

class MainTableView: UITableView {

    init(frame: CGRect, style: UITableViewStyle, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        super.init(frame: frame, style: style)
        self.delegate = delegate
        self.dataSource = dataSource
        separatorStyle = .None
        backgroundColor = theme.SDBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
