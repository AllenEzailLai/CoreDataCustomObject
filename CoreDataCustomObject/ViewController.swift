//
//  ViewController.swift
//  CoreDataCustomObject
//
//  Created by Allen Lai on 17/03/2015.
//  Copyright (c) 2015 Allen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSave_Clicked() {
    
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        newUser.username = txtUsername.text
        newUser.password = txtPassword.text
        
        context.save(nil)
        
        println(newUser)
        println("Object Saved")
    }
    
    @IBAction func btnLoad_Clicked() {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0 {
            
            for user in results {
                var thisUser = user as Users
//                println("The users username is \(thisUser.username)")
                println(thisUser.toString())
                thisUser.addFunnyPrefix("HaHa-")
                println(thisUser.toString())
                
            }
            println("\(results.count) found!")
        } else {
            println("No Result Found")
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

