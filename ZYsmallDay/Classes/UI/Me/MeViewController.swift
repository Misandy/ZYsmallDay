//
//  MeViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/13.
//  Copyright © 2015年 章宇. All rights reserved.

import UIKit

public let SD_UserIconData_Path = theme.cachesPath + "/iconImage.data"

enum SDMineCellType: Int {

    //个人中心
    case MyCenter = 0
    //我的订单
    case MyOrder = 1
    //我的收藏
    case MyCollect = 2
    //反馈留言
     case Feedback = 3
    //应用推荐
    case RecommendApp = 4
}

class MeViewController: MainViewController {

    private var loginLabel: UILabel!
    private var tableView: UITableView!
    private lazy var pickVC: UIImagePickerController = {
    
        let pickVC = UIImagePickerController()
//        pickVC.delegate = self
        pickVC.allowsEditing = true
        return pickVC
    }()
    
    private lazy var mineIcons: NSMutableArray = NSMutableArray(array: ["usercenter", "orders", "setting_like", "feedback", "recomment"])
    
//    private lazy var iconActionSheet: UIActionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "拍照", "从手机相册选择")
    
    private lazy var mineTitles: NSMutableArray = NSMutableArray(array: ["个人中心", "我的订单", "我的收藏", "留言反馈", "应用推荐"])
    
    private var iconView: IconView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //初始化导航条上的内容
        setNav()
        
         //设置tableView
            setTableView()
        }
    
        private func setNav() {
                navigationItem.title = "我的"
                navigationItem.leftBarButtonItem = nil
//                navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "settinghhhh", highlImageName: "settingh", targer: self, action: "settingClick")
        }
    
    private func setTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRectMake(0, 0, APPWidth, AppHeight - NavigationH - 49), style: UITableViewStyle.Grouped)
        tableView.backgroundColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
        // 设置tableView的headerView
        let iconImageViewHeight: CGFloat = 180
        let iconImageView = UIImageView(frame: CGRectMake(0, 0, APPWidth, iconImageViewHeight))
        iconImageView.image = UIImage(named: "quesheng")
        iconImageView.userInteractionEnabled = true
        
        // 添加未登录的文字
        let loginLabelHeight: CGFloat = 40
        loginLabel = UILabel(frame: CGRectMake(0, iconImageViewHeight - loginLabelHeight, APPWidth, loginLabelHeight))
        loginLabel.textAlignment = .Center
        loginLabel.text = "登陆,开始我的小日子"
        loginLabel.font = UIFont.systemFontOfSize(16)
        loginLabel.textColor = UIColor.colorWith(80, green: 80, blue: 80, alpha: 1)
        iconImageView.addSubview(loginLabel)
        
        // 添加iconImageView
        iconView = IconView(frame: CGRectMake(0, 0, 100, 100))
//        iconView!.delegate = self
        iconView!.center = CGPointMake(iconImageView.width * 0.5, (iconImageViewHeight - loginLabelHeight) * 0.5 + 8)
        iconImageView.addSubview(iconView!)
        
        tableView.tableHeaderView = iconImageView
    }
    
    func settingClick() {
    
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
}
