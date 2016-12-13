//
//  AWSUser.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/26/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info:  This file contains AWS User structure and adopts AWS DynamoDB Object Models and UserData protocols. This class retrieves data from DynamoDB.

import Foundation
import AWSCore
import AWSDynamoDB

class AWSUser: AWSDynamoDBObjectModel, AWSDynamoDBModeling, UserData{
    
    // Uesr Data variables
    var userId: String?
    var emailId: String?
    var password: String?
    
    
    // Confirm to AWSDynamoDBModeling Protocol

    // Returns the Amazon DynamoDB table name , returns a table name.
    
    public static func dynamoDBTableName() -> String{
        return AWSConstants.DYNAMODB_USERS_TABLE
    }
    
    
    // Returns the hash key attribute name, returns a hash key attribute name.
    
    public static func hashKeyAttribute() -> String{
        return "userId"
    }
    
    //Using convenience initializer as the values are default
    convenience init(userId: String) {
        self.init()
        self.userId = userId
    }
    
}
