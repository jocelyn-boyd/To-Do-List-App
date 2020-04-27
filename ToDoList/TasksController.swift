//
//  TasksController.swift
//  ToDoList
//
//  Created by Jocelyn Boyd on 4/26/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class TasksController: UITableViewController {
  
  var taskStore = TaskStore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let todoTasks = [Task(name: "Meditate"), Task(name: "Buy Bananas"), Task(name: "Run a 5K")]
    let doneTasks = [Task(name: "Watch Netflix")]
    
    taskStore.tasks = [todoTasks, doneTasks]
  }
  
}

// MARK: Data Source
extension TasksController {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? "To Do" : "Done"
  }
  
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 54
  }
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return taskStore.tasks.count
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return taskStore.tasks[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
    return cell
  }
  
}
