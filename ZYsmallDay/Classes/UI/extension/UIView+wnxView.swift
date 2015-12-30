//
//  UIView+wnxView.swift
//  ZYsmallDay
//
//  Created by 章宇 on 15/12/13.
//  Copyright © 2015年 章宇. All rights reserved.
//

import Foundation
import UIKit

/// 对UIView的扩展
extension UIView {

    // x
    var x: CGFloat {
    
        return self.frame.origin.x
    }
    
    // y
    var y: CGFloat {
    
        return self.frame.origin.y
    }
    
    //宽度
    var width: CGFloat {
    
        return self.frame.size.width
    }
    
    //高度
    var height: CGFloat {
    
        return self.frame.size.height
    }
    
    var size: CGSize {
    
        return self.frame.size
    }
    
    var point: CGPoint {
    
        return self.frame.origin
    }
}