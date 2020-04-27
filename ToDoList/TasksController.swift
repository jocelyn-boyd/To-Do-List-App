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
//    loadTasks()
  }
  
  
  @IBAction func AddTask(_ sender: UIBarButtonItem) {
//    print("Add Button Pressed")
    // set up alert controller
    let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
    
    // set up the actions
    let addAction = UIAlertAction(title: "Add", style: .default) {_ in
      
      // Grab textfield text
      guard let name = alertController.textFields?.first?.text else { return }
      
      //create task
      let newTask = Task(name: name)
      
      //add task
      self.taskStore.addTask(newTask, at: 0)
      
      //reload data in table view
      let indexPath = IndexPath(row: 0, section: 0)
      self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    addAction.isEnabled = false
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    // add the textfield
    alertController.addTextField { (textfield) in
      
      textfield.placeholder = "Enter task name ..."
      textfield.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
    }
    
    // add the actions
    alertController.addAction(addAction)
    alertController.addAction(cancelAction)
    
    // present alert controller
    present(alertController, animated: true)
  }
  
  
  @objc private func handleTextChanged(_ sender: UITextField) {
    
    // Grab the alert controller and add action
    guard let alertController = presentedViewController as? UIAlertController,
          let addAction = alertController.actions.first,
          let text = sender.text else { return }
    
    //Enable add action based on if text is empty or contains whitespace
    addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
  }
  
  
  func loadTasks() {
    
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

extension TasksController {
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    54
  }
  
  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
      
      // determine whether the task is 'isDone'
      let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
      
      // Remove the task from the appropriate array
      self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
      
      // Reload tableView
      self.tableView.deleteRows(at: [indexPath], with: .automatic)
      
      // Indicate that the action was performed
      completionHandler(true)
    }
    
    deleteAction.image = UIImage(named: "delete")
    deleteAction.backgroundColor = .red
    
    return UISwipeActionsConfiguration(actions: [deleteAction])
  }
  
  override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    return nil
  }
}
