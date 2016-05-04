//
//  ViewController.swift
//  ImageAnimation
//
//  Created by 張 景隆 on 2015/12/20.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...16 {
            
        }
        
        let images = (1...16).map { UIImage(named: "win_\($0)")! }
        animateImage.animationImages = images
        animateImage.animationDuration = 1
        animateImage.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

