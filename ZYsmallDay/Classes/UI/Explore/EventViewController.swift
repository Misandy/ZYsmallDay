//
//  EventViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// event 点击出来的viewcontroller ，这个控制器和另一个控制器高度重合，应该抽取一个基类的

import UIKit

class EventViewController: UIViewController {
    
    var model: EventModel? {
        
        didSet {
        
            
        }
    }
}
