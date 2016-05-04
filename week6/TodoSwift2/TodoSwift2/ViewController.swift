//
//  ViewController.swift
//  TodoSwift2
//
//  Created by 張 景隆 on 2015/11/14.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataSource = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // PART 1
//        dataSource = ["AAA", "BBB", "CCC"]
        
        // PART 2
        loadData()
        
        // 加入通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData", name: NSManagedObjectContextDidSaveNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //
        if segue.identifier == "toEdit" {
            if let editViewController = segue.destinationViewController as? EditViewController {
                editViewController.todoItem = sender as? TodoItem
            }
        }
    }

    func loadData() {
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // 建立查詢目標
        let request = NSFetchRequest(entityName: "TodoItem")
        
        // 執行查詢
        do {
            // 將查詢結果 存入 data source
            dataSource = try context.executeFetchRequest(request)
            tableView.reloadData()
        }
        catch let error as NSError {
            // 錯誤處理
            print(error.description)
        }
        
    }

    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Part 1
        /*
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell")
        let data = dataSource[indexPath.row]
        cell?.textLabel?.text = data as? String
        */
        
        // Part 2
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell")
        let todoItem = dataSource[indexPath.row] as? TodoItem
        cell?.textLabel?.text = todoItem?.name
        
        return cell!
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
        let todoItem = dataSource[indexPath.row] as? TodoItem
        
        performSegueWithIdentifier("toEdit", sender: todoItem)
    }
    
    // MARK: - UITableViewDataSource 刪除動作
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        //
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == .Delete) {
            // MARK: - UITableViewDataSource 處理刪除動作
            
            // 取得 todoItem
            guard let todoItem = dataSource[indexPath.row] as? TodoItem else { return }
            
            // 取得 Context
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            
            // 刪除 todoItem
            context.deleteObject(todoItem)
            
            appDelegate.saveContext()
            
        }
    }
}

