//
//  ViewController.swift
//  SimpleVideo
//
//  Created by 張 景隆 on 2015/12/7.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import MobileCoreServices

import AVKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker:UIImagePickerController!
    
    var moviePlayer:AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.Camera)
        print(mediaTypes)
        
        if mediaTypes!.contains(kUTTypeMovie as String) {
            // 支援錄影
            print("支援錄影")
        }
    }

    @IBAction func openRecorder(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = .CurrentContext
        imagePicker.sourceType = .Camera
        
        // 允許編輯
        imagePicker.allowsEditing = true
        
        imagePicker.delegate = self
        
        // 設定媒體類別
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            //
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        
        moviePlayer = AVPlayerViewController()
        let videoURL = info[UIImagePickerControllerMediaURL] as? NSURL
        let avPlayer = AVPlayer(URL:videoURL!)
        
        moviePlayer.player = avPlayer
        
        presentViewController(moviePlayer, animated: true, completion: nil)
    }

}

