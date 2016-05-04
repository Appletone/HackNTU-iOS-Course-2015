//
//  ViewController.swift
//  ViewControllerLifecycleDemo
//
//  Created by 張 景隆 on 2015/3/1.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name:String!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: 這是馬克
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.name = self.title
        print("\(name) init(coder:)")
    }
    
    override func loadView() {
        super.loadView()
        print("\(name) loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("----------------")
        print("\(name) viewDidLoad")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(name) viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("\(name) viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(name) viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(name) viewDidDisappear")
        print("----------------")
    }
    
}

