//
//  Users.swift
//  CoreDataCustomObject
//
//  Created by Allen Lai on 17/03/2015.
//  Copyright (c) 2015 Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Users)
class Users: NSManagedObject {

    @NSManaged var username: String
    @NSManaged var password: String
    
    func toString() -> String {
        return "The username is \(username) their password is \(password)"
    }

    func addFunnyPrefix(prefix: String) {
        username = username + prefix
    }
    
    func validPassword(inputPassword: String) -> Bool {
        if inputPassword == password {
            return true
        } else {
            return false
        }
    }
}
