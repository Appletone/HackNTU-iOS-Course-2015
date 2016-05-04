//
//  ViewController.swift
//  SimpleCamera
//
//  Created by 張 景隆 on 2015/5/6.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openCamera(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = .CurrentContext
        imagePicker.sourceType = .Camera
        
        // 允許編輯
        imagePicker.allowsEditing = true
        
        imagePicker.delegate = self
        
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            //
        }
    }
    
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = .CurrentContext
//        imagePicker.sourceType = .PhotoLibrary //
        imagePicker.sourceType = .SavedPhotosAlbum // 只有 相簿相機膠卷
        imagePicker.delegate = self
        
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            //
        }
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
        }
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }

}

