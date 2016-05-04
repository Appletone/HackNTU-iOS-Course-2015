//
//  ViewController.swift
//  SimpleMap
//
//  Created by 張 景隆 on 2015/11/30.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.requestWhenInUseAuthorization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

