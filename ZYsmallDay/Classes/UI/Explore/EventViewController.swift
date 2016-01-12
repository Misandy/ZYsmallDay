//
//  EventViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// event 点击出来的viewcontroller ，这个控制器和另一个控制器高度重合，应该抽取一个基类

import UIKit

// 探店发现 探店详情的高度
public let EventViewController_ShopView_Height: CGFloat = 45

class EventViewController: UIViewController {
    
    lazy var loadImage: LoadAnimatImageView = LoadAnimatImageView.sharedManager
    private let image = AppWidth - 23.0
    private let scrollShowNavH = DetailViewController_TopImageView_Height - NavigationH
    private lazy var showBlackImage = false
    private lazy var isLoadFinish = false
    private lazy var isAddButtomView = false
    private lazy var loadFinishScrollHeight: CGFloat = 0
    private lazy var guessLikeView: GuessLikeView = GuessLikeView.guessLikeViewFromXib()
    private lazy var moreArr: [MoreView] = [MoreView]()
    private lazy var shareView: ShareView = ShareView.shareViewFromXib()
    private lazy var backBtn: UIButton = UIButton()
    private lazy var likeBtn: UIButton = UIButton()
    private lazy var sharedBtn: UIButton = UIButton()
//    private lazy var webView: EventWebView = EventWebView(rect: MainBounds, webViewDelegate: self, webViewScrollViewDelegate: self)
    
    var model: EventModel? {
        
        didSet {
        
            
        }
    }
}

//   UIWebViewDelegate
extension EventViewController: UIWebViewDelegate {

    func webViewDidFinishLoad(webView: UIWebView) {
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.background='#F5F5F5';")
        isLoadFinish = true
        guessLikeView.frame = CGRect(x: 0, y: webView.scrollView.contentSize.height, width: AppWidth, height: 50)
        guessLikeView.hidden = false
        webView.scrollView.contentSize.height += 50
        for more in moreArr {
        
            more.frame = CGRect(x: 0, y: webView.scrollView.contentSize.height, width: AppWidth, height: 230)
            more.hidden = false
            webView.scrollView.contentSize.height += 235
            isAddButtomView = true
        }
        loadFinishScrollHeight = webView.scrollView.contentSize.height
    }
}

