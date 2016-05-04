//
//  ViewController.swift
//  WeatherExample
//
//  Created by 張 景隆 on 2015/12/18.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let uri = "http://api.openweathermap.org/data/2.5/weather?id=1668341&lang=zh_TW&units=metric&appid=2de143494c0b295cca9337e1e96b00e0"
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: uri)!) { (data, response, error) -> Void in
            //
//            print(data)
            let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
          
            if let j = json  {
                print(j)
                if let weathers = j["weather"] as? NSArray,
                        weather = weathers.firstObject as? NSDictionary,
                           desc = weather["description"] as? String,
                           icon = weather["icon"] as? String
                {
                    print(desc)
                    
                    self.downloadImage(icon)
                }
                
                if let main = j["main"] as? NSDictionary, temp = main["temp"] as? Double {
                    print(temp)
                    
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        //
                        self.tempLabel.text = "\(temp) °C"
                    })
                }
            }
        }
        
        task.resume()
    }
    
    func downloadImage(icon:String) {
        print(__FUNCTION__)
        
        let uri = "http://openweathermap.org/img/w/\(icon).png"
        let task = NSURLSession.sharedSession().downloadTaskWithURL(NSURL(string: uri)!) { (url, response, error) -> Void in
            
            let image = UIImage(data: NSData(contentsOfURL: url!)!)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //
                self.iconImageView.image = image
            })
            
        }
        
        task.resume()
    }



}

