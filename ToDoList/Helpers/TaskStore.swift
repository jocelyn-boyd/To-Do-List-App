//
//  TaskStore.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/26/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

class TaskStore {
  
  // this Task array is going to host the two sections of data
  // Outstanding Tasks at index of 0
  // Completed Tasks at index of 1
  var tasks = [[Task](), [Task]()]
  
  
  func addTask(_ task: Task, at index: Int, isDone: Bool = false) {
    
    let section = isDone ? 1 : 0
    
    tasks[section].insert(task, at: index)
  }
  
  
  @discardableResult func removeTask(at index: Int, isDone: Bool = false) -> Task {
    
    let section = isDone ? 1 : 0
    
    return tasks[section].remove(at: index)
  }
  
}
