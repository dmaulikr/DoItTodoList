//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Remus Victuelles on 18/12/16.
//  Copyright © 2016 Noypi Dev. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var btnAdd: UIButton!
    
    var referrerVC = TasksViewController()
    
    var task : Task = Task()
    var isEdit : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameTextField.text = task.name
        isImportantSwitch.isOn = task.important
        
        if task.name.isEmpty {
            btnAdd.setTitle("Add Task", for: UIControlState.normal)
            isEdit = false
        } else {
            btnAdd.setTitle("Update Task", for: UIControlState.normal)
            isEdit = true
        }
    }

    @IBAction func btnAddTapped(_ sender: Any) {
        
        if isEdit {
            let modifyTask = referrerVC.tasks.first(where: {$0.name == task.name})
            if modifyTask != nil {
                modifyTask?.name = taskNameTextField.text!
                modifyTask?.important = isImportantSwitch.isOn
            }
        } else {
            task.name = taskNameTextField.text!
            task.important = isImportantSwitch.isOn
            referrerVC.tasks.append(task)
        }
        
        referrerVC.mainTableView.reloadData()
        self.navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
