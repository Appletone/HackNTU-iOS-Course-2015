//
//  ViewController.swift
//  SimpleAnimation
//
//  Created by 張 景隆 on 2015/12/20.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var verticalSpaceTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定初始值
        imageView.alpha = 0
        joinButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // 改變圖片與最上層間距
        self.verticalSpaceTop.constant = 40
        
        // 如果改變view的一些屬性（如offsets）可能會導致布局的改變，那麼調用
        self.view.setNeedsUpdateConstraints()
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            // show Image
            self.imageView.alpha = 1
            
            // 如果想要立即改變布局，如會形成新的frame，那麼需要在調用
            self.view.layoutIfNeeded()
            
            }) { (isCompletion) -> Void in
                // 顯示 Join Button
                self.showJoinButton()
        }
        
    }
    
    func showJoinButton() {
        UIView.animateWithDuration(1) {
            // 將 Join Button 透明度設為 1
            self.joinButton.alpha = 1
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

