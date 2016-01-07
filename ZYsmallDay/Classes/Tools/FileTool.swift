//
//  FileTool.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/16.
//  Copyright © 2015年 章宇. All rights reserved.
//

import UIKit

class FileTool: NSObject {
    
    static let fileManager = NSFileManager.defaultManager()
    
    //计算单个文件的大小
    class func fileSize(path: String) -> Double {
        if fileManager.fileExistsAtPath(path) {
        var dict = try? fileManager.attributesOfItemAtPath(path)
            if let fileSize = dict![NSFileSize] as? Int{
            return Double(fileSize) / 1024.0 / 1024.0
            }
        }
           return 0.0
    }
    
    
    //彻底清除文件夹，异步
      class func cleanFolder(path: String, complete:() -> ()) {

       SVProgressHUD.showWithStatus("正在清理缓存", maskType: SVProgressHUDMaskType.Clear)
        let queue = dispatch_queue_create("cleanQueue", nil)
        
        dispatch_async(queue) { () -> Void in
            let chilerFiles = self.fileManager.subpathsAtPath(path)
            for fileName in chilerFiles! {
                
                let tmpPath = path  as NSString
                let fileFullPathName = tmpPath.stringByAppendingPathComponent(fileName)
                if self.fileManager.fileExistsAtPath(fileFullPathName) {
                    do {
                        try self.fileManager.removeItemAtPath(fileFullPathName)
                    } catch _ {
                    }
                }
            }
        }
    }


}

