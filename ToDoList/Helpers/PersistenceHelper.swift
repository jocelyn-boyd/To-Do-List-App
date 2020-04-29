//
//  PersistenceHelper.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/27/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

struct PersistenceHelper<T: Codable> {
  
  func getObjects() throws -> [T] {
    guard let data = FileManager.default.contents(atPath: url.path) else {
      return []
    }
    return try PropertyListDecoder().decode([T].self, from: data)
  }
  
  
  func getSingleObject() throws -> T? {
    guard let data = FileManager.default.contents(atPath: url.path) else {
      return nil
    }
    return try PropertyListDecoder().decode(T.self, from: data)
  }
  
  
  func saveSingleObject(newElement: T) throws {
    var element = try getSingleObject()
    element = newElement
    let serializedData = try PropertyListEncoder().encode(element)
    try serializedData.write(to: url, options: Data.WritingOptions.atomic)
  }
  
  
  func save(newElement: T) throws {
    var elements = try getObjects()
    elements.append(newElement)
    let serializedData = try PropertyListEncoder().encode(elements)
    try serializedData.write(to: url, options: Data.WritingOptions.atomic)
  }
  
  
  init(fileName: String){
    self.fileName = fileName
  }
  
  
  private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  
  private func filePathFromDocumentsDirectory(name: String) -> URL {
    return documentsDirectory.appendingPathComponent(name)
  }
  
  
  private let fileName: String
  private var url: URL { return filePathFromDocumentsDirectory(name: fileName) }
}


struct TaskPersistence {
  
  static let manager = TaskPersistence()
  
  
  func save(newTask: Task) throws {
    try persistenceHelper.save(newElement: newTask)
  }
  
  
  func getTask() throws -> [Task] {
    return try persistenceHelper.getObjects()
  }
  
  
  private let persistenceHelper = PersistenceHelper<Task>(fileName: "tasks.plist")
  private init() {}
  
}
