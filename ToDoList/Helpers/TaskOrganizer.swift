//
//  TaskOrganizer.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/28/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

class TaskOrganizer {
  
  // separate the tasks
  
  func organizeTasks(from tasks: [Task]) -> [TaskList] {
    
    let completeTasks = TaskList(task: tasks.filter({ $0.isDone }))
    let outstandingTasks = TaskList(task: tasks.filter({ !$0.isDone }))
    
    return [completeTasks, outstandingTasks]
  }
  
}
