//
//  UserData.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/26/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import Foundation

//Structure defining the UserData

struct UserDatas : UserData {
    var userId : String?
    var emailId : String?
    var password : String?
    
}

//User Data protocol - to abstract user level information

protocol UserData {
    var userId : String? {get set}
    var emailId : String? {get set}
    var password : String? {get set}
}

// methods to validate current user info and update user info

extension UserData  {
    
    // Chcek if current user Data and incoming user data are equal
    
    func isEqualTo(_ other: UserData) -> Bool {
        return isDataEqualTo(other)
    }
    
    func isDataEqualTo(_ otherData: UserData) -> Bool {
        let dataEqual = self.userId == otherData.userId &&
            self.emailId == otherData.emailId && self.password == otherData.password
        return dataEqual
    }
    
    //mutating function to update the UserData structure values
    
    mutating func updateWithData(_ other: UserData) {
        
        if self.userId != other.userId {
            self.userId = other.userId
        }
        
        if self.emailId != other.emailId {
            self.emailId = other.emailId
        }
        
        if self.password != other.password {
            self.password = other.password
        }
    }
    
}


