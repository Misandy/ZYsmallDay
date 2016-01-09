//
//  UIImageView+wnxImage.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/8.
//  Copyright © 2016年 章宇. All rights reserved.
// 对UIimageview的扩展

import Foundation

extension UIImageView {
    
    func wxn_setImageWithURL(url: NSURL, placeholderImage: UIImage) {
        self.sd_setImageWithURL(url, placeholderImage: placeholderImage)
    }
    
}