//
//  NavigatorViewController.swift
//  ZYsmallDay
//
//  Created by 章宇 on 16/1/17.
//  Copyright © 2016年 章宇. All rights reserved.
//

import UIKit

class NavigatorViewController: UIViewController {
    
    var model: EventModel? {
    
        didSet {
            if let shopLocaltion = model?.position?.stringToCLLocationCoordinate2D(",") {
                let point = MAPointAnnotation()
                point.coordinate = shopLocaltion
                self.mapView.addAnnotation(point)
                self.mapView.setCenterCoordinate(shopLocaltion, animated: true)
                self.mapView.setZoomLevel(15, animated: true)
            }
        }

    }
    
    private lazy var mapView: MAMapView = {
        let mapView = MAMapView()
        mapView.frame = MainBounds
//        mapView.delegate = self
        mapView.showsCompass = false
        mapView.showsScale = false
        mapView.showsUserLocation = true
        mapView.logoCenter.x = AppWidth - mapView.logoSize.width + 20
        mapView.setZoomLevel(14, animated: true)
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}