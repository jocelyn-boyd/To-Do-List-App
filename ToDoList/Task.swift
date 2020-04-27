//
//  Task.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/26/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

class Task {
  
  var name: String
  var isDone: Bool = false
  
  init(name: String, isDone: Bool) {
    self.name = name
    self.isDone = isDone
  }
  
  
}
