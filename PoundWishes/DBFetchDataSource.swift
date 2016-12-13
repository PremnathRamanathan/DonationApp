//
//  DBFetchDataSource.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 12/12/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info : This file acts as the date source for basic User information


import Foundation

class DBFetchDataSource: NSObject{
    
    //MARK - Public API
    var email : String?
    var firstname : String?
    var lastname : String?
    var role : String?

    // Empty Constructor
    override init(){
        
    }
    
    init(email: String,firstname: String,lastname: String, role: String) {
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.role = role

    }
    
    //Data
    static func createWishes()-> [DBFetchDataSource]{
        return []
    }

}
