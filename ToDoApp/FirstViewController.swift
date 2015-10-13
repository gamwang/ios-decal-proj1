//
//  FirstViewController.swift
//  ToDoApp
//
//  Created by Jonathan Bai on 10/10/15.
//  Copyright © 2015 IOS Decal. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTodos: UITableView!
    
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
        tblTodos.reloadData()
    }

    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            todoMgr.todos.removeAtIndex(indexPath.row)
            tblTodos.reloadData()
        }
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoMgr.todos.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        print("FFFFFGGG")
        let curIndex = indexPath.item
        if (todoMgr.todos[curIndex].completed) {
            todoMgr.todos[curIndex].completed = false
        } else {
            todoMgr.todos[curIndex].completed = true
        }
        todoMgr.todos[curIndex].timestamp = NSDate()
        tblTodos.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        let elem = todoMgr.todos[indexPath.row]
        cell.textLabel?.text = elem.name
        cell.detailTextLabel?.text = elem.desc
        if (elem.completed) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }

}

