//
//  String+wnxString.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/17.
//  Copyright © 2016年 章宇. All rights reserved.
//

import Foundation
//  string扩展
extension String {
    //  将字符串转换成经纬度
    func stringToCLLocationCoordinate2D(separator: String) -> CLLocationCoordinate2D? {
        
        let arr = self.componentsSeparatedByString(separator)
        if arr.count != 2 {
        
            return nil
        }
        
        let latitude: Double = NSString(string: arr[1]).doubleValue
        let longitude: Double = NSString(string: arr[0]).doubleValue
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension NSMutableString {
    
    class func changeHeigthAndWidthWithSrting(searchStr: NSMutableString) -> NSMutableString {
        var mut = [CGFloat]()
        var mutH = [CGFloat]()
        let imageW = AppWidth - 23
//        let rxHeight = NSRegularExpression(pattern: "(?<= height=\")\\d*")
//        let rxWidth = NSRegularExpression(pattern: "(?<=width=\")\\d*")
//      var rx = NSRegularExpression(pattern:"\d+")
        let rxHeight = NSRegularExpression(pattern: "(?<= height=\")\\d*")
        let rxWidth = NSRegularExpression(pattern: "(?<=width=\")\\d*")
        let widthArray = rxWidth.matches(searchStr as String) as! [String]
        
        for width  in widthArray {
            Int(width)!
            mut.append(imageW/CGFloat(Int(width)!))
        }
        
        var widthMatches = rxWidth.matchesInString(searchStr as String, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, searchStr.length))
        
        for var i = widthMatches.count - 1; i >= 0; i-- {
            let widthMatch = widthMatches[i] as NSTextCheckingResult
            searchStr.replaceCharactersInRange(widthMatch.range, withString: "\(imageW)")
        }
        
        let newString = searchStr.mutableCopy() as! NSMutableString
        
        let heightArray = rxHeight.matches(newString as String) as! [String]
        for i in 0..<mut.count {
            mutH.append(mut[i] * CGFloat(Int(heightArray[i])!))
        }
        
        var matches = rxHeight.matchesInString(newString as String, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, newString.length))
        
        for var i = matches.count - 1; i >= 0; i--
        {
            let match = matches[i] as NSTextCheckingResult
            newString.replaceCharactersInRange(match.range, withString: "\(mutH[i])")
        }
        
        return newString
    }
}