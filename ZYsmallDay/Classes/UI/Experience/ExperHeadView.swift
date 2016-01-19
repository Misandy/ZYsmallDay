//
//  ExperHeadView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/17.
//  Copyright © 2016年 章宇. All rights reserved.
//  体验顶部广告scrollview

import UIKit

class ExperHeadView: UIView, UIScrollViewDelegate {

    var experModel: ExperienceModel? {
        didSet {
            if experModel?.head?.count > 0 {
                page.numberOfPages = experModel!.head!.count
                scrollImageView.contentSize = CGSizeMake(self.width * CGFloat(experModel!.head!.count), 0)
                
                for i in 0..<experModel!.head!.count {
                    let imageV = UIImageView(frame: CGRectMake(CGFloat(i) * AppWidth, 0, AppWidth, self.height * 0.8))
                    imageV.wxn_setImageWithURL(NSURL(string: experModel!.head![i].adurl!)!, placeholderImage: UIImage(named: "quesheng")!)
                    imageV.tag = i + 1000
                    
                    let tap = UITapGestureRecognizer(target: self, action: "imageClick:")
                    imageV.userInteractionEnabled = true
                    imageV.addGestureRecognizer(tap)
                    scrollImageView.addSubview(imageV)
                }
            }
        }
    }
    
    ///MARK:- 懒加载对象
    private lazy var scrollImageView: UIScrollView = {
        let scrollImageView = UIScrollView()
        scrollImageView.delegate = self
        scrollImageView.showsHorizontalScrollIndicator = false
        scrollImageView.showsVerticalScrollIndicator = false
        scrollImageView.pagingEnabled = true
        return scrollImageView
    }()
    
    private var page: UIPageControl = {
        let page = UIPageControl()
        page.pageIndicatorTintColor = UIColor.grayColor()
        page.currentPageIndicatorTintColor = UIColor.blackColor()
        page.hidesForSinglePage = true
        return page
    }()
    
    weak var delegate: ExperHeadViewDelegate?

}

// MARK:- 协议
protocol ExperHeadViewDelegate: NSObjectProtocol {
    
    func experHeadView(headView: ExperHeadView, didClickImageViewAtIndex index: Int)
    
}