//
//  CompletedTableViewController.swift
//  todoapp
//
//  Created by Divyaraj Bakrola on 11/2/18.
//  Copyright © 2018 Divyaraj Bakrola. All rights reserved.
//

import UIKit
import CoreData

class CompletedTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    
    @IBOutlet weak var tableView: UITableView!
   
    var completed: [String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return completed.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath) as! DoneCell
        
        cell.completedLabel.text = completed[indexPath.row]
        
        return cell
    }
    

    func loadData() {
        
        guard let appDelegate =
            
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Completed")
        
        do {
            let  taskManagedObj = try managedContext.fetch(fetchRequest)
            setCompletedTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            self.completed.append(taskTitle)
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 100
        self.tableView.reloadData()
        

       
    }
    
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    

}
