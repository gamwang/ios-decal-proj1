//
//  ToDoManager.swift
//  ToDoApp
//
//  Created by Jonathan Bai on 10/10/15.
//  Copyright © 2015 IOS Decal. All rights reserved.
//

import UIKit

var todoMgr: ToDoManager = ToDoManager();

struct todo{
    var name = "Un-Named"
    var desc = "Un-Described"
    var completed = false
    var timestamp = NSDate()
}
class ToDoManager: NSObject {
    var todos = [todo]();
    func addTodo(name: String, desc: String) {
        todos.append(todo(name: name,desc: desc, completed: false, timestamp: NSDate()))
    }
    
    func countCompleted() -> Int{
        var count = 0;
        for elem in todos {
            if (elem.completed) {
                count += 1;
            }
        }
        return count;
    }
    
    func cleanOld() {
        let cur = NSDate().timeIntervalSinceReferenceDate
        var out = [todo]()
        for elem in todos {
            let time = elem.timestamp.timeIntervalSinceReferenceDate
            if (time - cur < 86400) {
                out.append(elem)
            }
        }
        todos = out
    }
}   
