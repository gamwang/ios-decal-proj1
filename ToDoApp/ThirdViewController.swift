//
//  ThirdViewController.swift
//  ToDoApp
//
//  Created by Jonathan Bai on 10/11/15.
//  Copyright © 2015 IOS Decal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var completedText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        todoMgr.cleanOld()
        completedText.text = String(todoMgr.countCompleted())
    }
    
}
