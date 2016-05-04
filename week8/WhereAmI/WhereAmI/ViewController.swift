//
//  ViewController.swift
//  WhereAmI
//
//  Created by 張 景隆 on 2015/11/27.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        // 重要！！ 
        // 如果 使用者尚未決定 是否提供座標，則詢問使用者
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization()
        }
        
        // 設定精準度
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestLocation()
        
        geocoder()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        print(__FUNCTION__, locations)
        
        // PART 2
//        if let location = locations.last {
//            self.reverseGeocoder(location)
//        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        //
        print(error)
    }

    
    // MARK: - 反轉 Reverse Geocoder
    func reverseGeocoder(location:CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            //
            print("reverseGeocodeLocation")
            
            if let pms = placemarks, placemark = pms.first {
                print(placemark.thoroughfare)
                
                print(placemark.addressDictionary?["FormattedAddressLines"]?.componentsJoinedByString(","))
            }
        }
    }
    
    // MARK: - 正轉 Geocoder
    func geocoder() {
        CLGeocoder().geocodeAddressString("台北市大安區羅斯福路四段1號") { (placemark, error) -> Void in
            //
            print(__FUNCTION__, placemark?.first?.location)
        }
    }
}










