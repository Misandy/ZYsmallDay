//
//  DetailViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/11.
//  Copyright © 2016年 章宇. All rights reserved.
//  体验详情viewcontroller
//  方法1:在Xcode中解决，在返回的html数据请求前，改变所有图片的尺寸，适配到正常尺寸  缺点：重新过滤字符串的时候挺麻烦的，每次都要重新加载图片，费流量
//  方法2:自己写css文件来布局（推荐）
//  方法3:拦截所有的图片请求，于js配合，将请求路径给到程序里，用正常模式加载，可以点击，缓存等（功能更加强大，可随意自定义，设置placeholder图片等）

import UIKit

//  详情viewcontroller顶部图片的高度
public let DetailViewController_TopImageView_Height: CGFloat = 225

class DetailViewController: UIViewController {

    //  model 重新didset方法
    var model: EventModel? {
        didSet {
        
        }
    }
}
