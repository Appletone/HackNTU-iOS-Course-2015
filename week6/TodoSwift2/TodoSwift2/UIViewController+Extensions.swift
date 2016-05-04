//
//  UIViewController+Extensions.swift
//  Todo
//
//  Created by 張 景隆 on 2015/11/14.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var appDelegate:AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
}
