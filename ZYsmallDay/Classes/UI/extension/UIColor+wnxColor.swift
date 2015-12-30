//
//  UIColor+wnxColor.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/12.
//  Copyright © 2015年 章宇. All rights reserved.
//

import Foundation
import UIKit

// UIColor的扩展
extension UIColor {
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
}


