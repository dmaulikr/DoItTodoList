//
//  TasksViewController.swift
//  DoIt
//
//  Created by Remus Victuelles on 18/12/16.
//  Copyright © 2016 Noypi Dev. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = task.important ? "‼️ \(task.name)" : task.name
        
//        let taskName = UILabel(frame: CGRect(x: 10, y: 10, width: 4 * cell.frame.width / 5, height: 40) )
//        taskName.text = task.name
//        taskName.tag = 100
        
//        let isImportant = UISwitch(frame: CGRect(x: 4 * cell.frame.width / 5, y: 10, width: 50.0, height: 40))
//        isImportant.isOn = task.important
//        isImportant.isEnabled = false
//        isImportant.tag = 101
        
        
//        cell.contentView.addSubview(taskName)
//        cell.contentView.addSubview(isImportant)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "addSegue", sender: tasks[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy groceries"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Study iOS"
        task3.important = true
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func btnAddTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addTaskViewController = segue.destination as! AddTaskViewController
        
        addTaskViewController.referrerVC = self
        
        if sender == nil {
            addTaskViewController.title = "Add Task"
        } else {
            addTaskViewController.title = "Edit Task"
            addTaskViewController.task = sender as! Task
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

