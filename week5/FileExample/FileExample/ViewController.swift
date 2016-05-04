//
//  ViewController.swift
//  FileExample
//
//  Created by 張 景隆 on 2015/4/12.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 印出 Documents 目錄
        print(self.applicationDocumentsDirectory)
        
        writeDictionary()
        writeArray()
        
        loadDictionary()
        loadArray()
        
        loadFromBundle()
        loadInfoPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:
    // MARK: 載入 info.plist
    func loadInfoPlist() {
        let version: AnyObject? = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"]
        print(version)
    }
    // MARK: 從 App 讀取 myplist.plist 檔案
    func loadFromBundle() {
        let bundle = NSBundle.mainBundle()
        let myplistPath = bundle.pathForResource("myplist", ofType: "plist")
        let myplistDictionary = NSDictionary(contentsOfFile: myplistPath!)
        print(myplistDictionary)
    }
    
    // MARK:
    // MARK: 讀取 Documents Dictionary
    func loadDictionary() {
        let fileURL = applicationDocumentsDirectory.URLByAppendingPathComponent("dict.plist")
        print(fileURL)
        
        let nsdict = NSDictionary(contentsOfURL: fileURL)
        print(nsdict)
    }
    
    // MARK: 讀取 Documents Array
    func loadArray() {
        let fileURL = applicationDocumentsDirectory.URLByAppendingPathComponent("arr.plist")
        print(fileURL)
        
        let nsarr = NSArray(contentsOfURL: fileURL)
        print(nsarr)
    }
    // MARK:
    // MARK: Dictionary 寫入檔案
    func writeDictionary() {
        let dict = ["key1":"value2",
            "key2": "value2"]
        let nsdict = dict as NSDictionary
        let nsdictURL = applicationDocumentsDirectory.URLByAppendingPathComponent("dict.plist")
        
        print(nsdictURL)
        nsdict.writeToURL(nsdictURL, atomically: true)
    }

    // MARK: Array 寫入檔案
    func writeArray() {
        let arr = ["element1", "element2"]
        let nsarr = arr as NSArray
        let nsarrURL = applicationDocumentsDirectory.URLByAppendingPathComponent("arr.plist")
        print(nsarrURL)
        nsarr.writeToURL(nsarrURL, atomically: true)
    }
    // MARK:
    // MARK: Documents 目錄
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] 
        }()
}

