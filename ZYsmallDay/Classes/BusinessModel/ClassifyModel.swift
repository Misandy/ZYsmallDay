//
//  ClassifyModel.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/15.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class ClassifyModel: NSObject {
}

class DetailModel: NSObject, DictModelProtocol {

    var msg: String?
    var code: Int = -1
    var list: [EventModel]?
    
    static func customClassMapping() -> [String : String]? {
        return ["list" : "\(EventModel.self)"]
    }
    
    //加载详情模型
    class func loadDetails(completion: (data: DetailModel?, error: NSError?) -> ()) {
    
        loadDatas("Details", isShowDis: false, completion: completion)
    }
    
    // 加载美辑点击按钮的更多模型
    class func loadMore(completion: (data: DetailModel?, error: NSError?) -> ()) {
        loadDatas("More", isShowDis: false, completion: completion)
    }
    
    // 加载附近店铺数据
    class func loadNearDatas(completion: (data: DetailModel?, error: NSError?) -> ()) {
        loadDatas("Nears", isShowDis: true, completion: completion)
    }
    
    private class func loadDatas(fileName: String, isShowDis: Bool, completion: (data: DetailModel?, error: NSError?) -> ()) {
    
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        if let data = NSData(contentsOfFile: path!) {
        
            let dict = (try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let datas = modelTool.objectWithDictionary(dict, cls: DetailModel.self) as? DetailModel
            if isShowDis {
            
                for event in datas!.list! {
                
                    event.isShowDis = true
//                    if UserInfoManager.sharedUserInfoManager.userPosition != nil {
//                    let userL = UserInfoManager.sharedUserInfoManager.userPosition!
//                        let shopL = event.position!.stringToCLLocationCoodinate2D(",")!
//                    let dis = MAMetersBetweenMapPoints(MAMapPointForCoodinate(userL), MAMapPointForCoodinate(shopL))
//                        event.distanceForUser = String(format: "%.1fkm", dis * 0.001)
//                    }
                }
            }
            completion(data: datas, error: nil)
        }
    }
}