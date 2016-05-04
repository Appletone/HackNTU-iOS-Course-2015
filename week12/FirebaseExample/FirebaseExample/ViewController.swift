//
//  ViewController.swift
//  FirebaseExample
//
//  Created by 張 景隆 on 2015/12/24.
//  Copyright © 2015年 張 景隆. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Create a reference to a Firebase location
    let firebase = Firebase(url:"https://dazzling-inferno-7543.firebaseio.com")
    
    var chatLines = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func doSend(sender: AnyObject) {
        self.firebase.childByAutoId().setValue(["name":self.nameTextField.text!, "message": self.messageTextField.text!])
        
        self.messageTextField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.doSend(textField)
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageTextField.delegate = self

//        write()
        
//        read()
        
//        createUser()

        self.firebase.observeEventType(.ChildAdded, withBlock: { (snapshot) -> Void in
            //
            print(snapshot)
            let value = snapshot.value
            if let name = value["name"] as? String, message = value["message"] as? String {
                self.textView.text = "\(name): \(message) \n\(self.textView.text)"
            }
        })
        
    }

    func write() {
        // Write data to Firebase
        firebase.setValue("Do you have data? You'll love Firebase.")
    }
    
    func read() {
        // Read data and react to changes
        firebase.observeEventType(.Value, withBlock: {
            snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
        })
    }
    
    func createUser() {
        firebase.createUser("bobtony@example.com", password: "correcthorsebatterystaple",
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    print(error)
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
        })
    }


}

