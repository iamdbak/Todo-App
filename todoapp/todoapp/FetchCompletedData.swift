//
//  FetchCompletedData.swift
//  todoapp
//
//  Created by Divyaraj Bakrola on 11/11/18.
//  Copyright © 2018 Divyaraj Bakrola. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FetchCompletedData {
    
    static var completed:[String] = []
    
    init() {
        
    }
    
    static func fetchData() {
        
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
    
    static  func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            FetchCompletedData.completed.append(taskTitle)
        }
        
        
    }
    
    
}
