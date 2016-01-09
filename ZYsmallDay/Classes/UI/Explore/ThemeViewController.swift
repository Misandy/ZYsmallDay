//
//  ThemeViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/5.
//  Copyright © 2016年 章宇. All rights reserved.
// themecell 点击出来的viewcontroller

import UIKit

// DetailCell的公共标识
public let SD_DetailCell_Identifier = "DetailCell"

class ThemeViewController: UIViewController, UIWebViewDelegate {

    var themeModel: ThemeModel? {
    
        didSet {
            if themeModel?.hasweb == 1 {
            self.webView?.loadRequest(NSURLRequest(URL: NSURL(string: themeModel!.themeurl!)!))
                shareView?.shareModel = ShareModel(shareTitle: themeModel?.title, shareURL: themeModel?.themeurl, image: nil, shareDetail: themeModel?.text)
            }
        }
    }
    
    var more: DetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化UI
        setUpUI()
    }
    
    // 懒加载属性
    private lazy var backView: UIView = {
    
        let backView = UIView(frame: MainBounds)
        backView.backgroundColor = theme.SDBackgroundColor
        return backView
    }()
    
    private lazy var moreTableView: MainTableView = {
    
        let tableView = MainTableView(frame: MainBounds, style: .Plain, dataSource: self, delegate: self)
        return tableView
    }()
    
    private lazy var shareView: ShareView? = {
    
       let shareView = ShareView.shareViewFromXib()
        return shareView
    }()
    
    private lazy var webView: UIWebView? = {
    
       let web = UIWebView(frame: MainBounds)
        web.backgroundColor = theme.SDBackgroundColor
        web.delegate = self
        return web
    }()
    
    // Function
    private func setUpUI() {
    
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(backView)
        backView.addSubview(moreTableView)
        
    }
    
    private lazy var modalBtn: UIButton! = UIButton()
    
    // WebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView) {
        self.webView!.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        modalBtn.hidden = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        modalBtn.hidden = false
    }
}

// TableView的代理方法
extension ThemeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return more?.list?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SD_DetailCell_Identifier) as! DetailCell
        let everyModel = more!.list![indexPath.row]
        cell.model = everyModel
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = more!.list![indexPath.row]
        let eventVC = EventViewController()
        eventVC.model = model
        navigationController!.pushViewController(eventVC, animated: true)
    }
}
