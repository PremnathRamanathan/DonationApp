//
//  RemoteService.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnathon 11/26/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info:  This file contains protocol for accessing AWS features from ViewControllers. Current user configurations.

import Foundation

// type alias - to reuse function parameters

typealias UserDataBlock = (_ userData : UserData?, _ error : NSError?) -> Void
typealias ErrorBlock = (_ error : NSError?) -> Void

// Protocol for AWS access
protocol RemoteService {
    // check for current user identity
    
    var hasCurrentUserIdentity : Bool {get}
    var currentUser : UserData? {get}
    var isEmailIDExists : Bool {get}
    
    // Method signatures - Current User
    
    func createCurrentUser(userData : UserData?, completion : @escaping ErrorBlock)
    func updateCurrentUser(userData :  UserData?, completion : @escaping ErrorBlock)
    func fetchCurrentUser(completion : @escaping UserDataBlock)
    func queryAWSUser(userData : UserData?, completion : @escaping ErrorBlock)
}

