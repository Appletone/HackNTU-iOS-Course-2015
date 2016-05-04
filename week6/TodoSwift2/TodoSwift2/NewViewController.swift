//
//  NewViewController.swift
//  TodoSwift2
//
//  Created by 張 景隆 on 2015/11/14.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreData

class NewViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doSave(sender: AnyObject) {
        print("do save \(nameTextField.text)")
        
        // 講解 guard let 使用語法 與 if let 差別
        guard let todoName = nameTextField.text where !todoName.isEmpty else {
            // Alert
            // 建立 UIAlertController
            let alert = UIAlertController(title: "提醒", message: "請輸入資料！", preferredStyle: .Alert)
            
            // 增加 Action
            let ok = UIAlertAction(title: "OK", style: .Default , handler:nil)
            
            // 把 Action 加到 UIAlertController
            alert.addAction(ok)
            
            // 顯示 Alert
            self.presentViewController(alert, animated: true, completion: nil);
            
            return
        }
        
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // 建立 Entity
        let todoItem = NSEntityDescription.insertNewObjectForEntityForName("TodoItem", inManagedObjectContext: context) as! TodoItem

        todoItem.name = todoName
        
        // 儲存 Todo項目
        appDelegate.saveContext()
        
        navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
