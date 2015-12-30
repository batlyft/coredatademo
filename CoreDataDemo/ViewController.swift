//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Bat Computer on 11/9/15.
//  Copyright © 2015 HardSoft. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        /*
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Rayna", forKey: "username")
        
        newUser.setValue("im2slfish", forKey: "password")
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Incorrect username and/or password!")
            
        }
        */

        
        let request = NSFetchRequest(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Bernadette")
        
        request.returnsObjectsAsFaults = false
        
        do {
        
        let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                   /* context.deleteObject(result)
                    
                    //result.setValue("Bernadette", forKey: "username")
                    
                    do {
                        
                        try context.save()
                        
                    } catch {
                        
                        
                        
                    }

                    */
                    
                    if let username = result.valueForKey("username") as? String {
                    
                    print(username)
                    
                    }
                    
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

