//
//  Task.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/26/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

class Task: Codable {
  
  var name: String
  var isDone: Bool
  
  init(name: String, isDone: Bool = false) {
    self.name = name
    self.isDone = isDone
  }
  
}
  

//class Task: NSObject, NSCoding {
//
//  var name: String?
//  var isDone: Bool?
//
//  private let nameKey = "name"
//  private let isDoneKey = "isDone"
//
//  init(name: String, isDone: Bool = false) {
//    self.name = name
//    self.isDone = isDone
//  }
//
//  func encode(with aCoder: NSCoder) {
//
//    aCoder.encode(name, forKey: nameKey)
//    aCoder.encode(isDone, forKey: isDoneKey)
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//
//    guard let name = aDecoder.decodeObject(forKey: nameKey) as? String,
//          let isDone = aDecoder.decodeObject(forKey: isDoneKey) as? Bool
//          else { return }
//
//    self.name = name
//    self.isDone = isDone
//  }
//
//}
