//
//  TaskPersistenceManager.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/29/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

struct TaskPersistenceManager {
  
  static let manager = TaskPersistenceManager()
  
  
  func save(newTask: Task) throws {
    try persistenceHelper.save(newElement: newTask)
  }
  
  
  func getTask() throws -> [Task] {
    return try persistenceHelper.getObjects()
  }
  
  
  private let persistenceHelper = PersistenceHelper<Task>(fileName: "tasks.plist")
  private init() {}
  
}
