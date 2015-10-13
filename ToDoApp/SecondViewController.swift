//
//  SecondViewController.swift
//  ToDoApp
//
//  Created by Jonathan Bai on 10/10/15.
//  Copyright © 2015 IOS Decal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textTodo: UITextField!
    @IBOutlet var textDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Events
    @IBAction func buttonAddTodo(sender: UIButton) {
        todoMgr.addTodo(textTodo.text!, desc: textDesc.text!)
        self.view.endEditing(true)
        textTodo.text = ""
        textDesc.text = ""
        //self.tabBarController?.selectedIndex = 0
    }
    
    // IOS Touch Function
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

