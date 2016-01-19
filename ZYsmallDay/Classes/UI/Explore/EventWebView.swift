//
//  EventWebView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
//  美天详情webview

import UIKit

class EventWebView: UIWebView {
    
    init(rect: CGRect, webViewDelegate: UIWebViewDelegate?, webViewScrollViewDelegate: UIScrollViewDelegate?) {
        super.init(frame: rect)
        
        let topImageShopViewHeight: CGFloat = DetailViewController_TopImageView_Height - 20 + EventViewController_ShopView_Height
        scrollView.contentInset = UIEdgeInsets(top: topImageShopViewHeight, left: 0, bottom: 0, right: 0)
        scrollView.setContentOffset(CGPoint(x: 0, y: -topImageShopViewHeight), animated: false)
     scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = webViewScrollViewDelegate
        delegate = webViewDelegate
        backgroundColor = theme.SDWebViewBacagroundColor
        paginationBreakingMode = UIWebPaginationBreakingMode.Column
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
