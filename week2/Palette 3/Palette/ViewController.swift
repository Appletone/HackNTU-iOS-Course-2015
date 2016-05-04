//
//  ViewController.swift
//  Palette
//
//  Created by Appletone on 2014/8/8.
//  Copyright (c) 2014年 Appletone. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        if let colorData: AnyObject = defaults.objectForKey("myColor") {
            
            let color: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(colorData as! NSData)
            self.view.backgroundColor = color as? UIColor
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func doChange(sender: AnyObject) {
        
        let color = UIColor(
               red: CGFloat(rSlider.value),
             green: CGFloat(gSlider.value),
              blue: CGFloat(bSlider.value),
             alpha: 1)
        
        self.view.backgroundColor = color
        
        
        let colorData = NSKeyedArchiver.archivedDataWithRootObject(color)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(colorData, forKey: "myColor")
        defaults.synchronize()
    }
    
    
    func captureColor() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, false, 2)
        
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }
    
    @IBAction func doShare(sender: AnyObject) {
        let image = captureColor()
        let compose = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        compose.addImage(image)
        compose.setInitialText("My favorite color!")
        
        self.presentViewController(compose, animated: true) { () -> Void in
            //
            
            
        }
        
    }
}

