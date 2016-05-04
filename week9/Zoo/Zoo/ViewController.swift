//
//  ViewController.swift
//  Zoo
//
//  Created by 張 景隆 on 2015/12/5.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var sounds:[SystemSoundID] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        for i in 1...6 {
            var soundID:SystemSoundID = 0
            
            let soundURL = NSBundle.mainBundle().URLForResource("\(i)", withExtension: "wav")
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
            
            sounds.append(soundID)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doSay(sender: AnyObject) {
        let index = Int(arc4random_uniform(6))
        print(index)

        let soundID = sounds[index]
        AudioServicesPlaySystemSound(soundID)
        
    }


}

