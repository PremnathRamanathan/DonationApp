//
//  AWSConfig.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/22/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info: This file contains code to configure and establish connection to AWS. AWSConfig adopts RemoteService protocol.Create, update, fetch user data from AWS here.


import Foundation
import AWSCore
import AWSDynamoDB
import AWSS3

class AWSConfig: RemoteService {
    
    // MARK : Properties of RemoteService
    var hasCurrentUserIdentity : Bool{
        return persistentUserId != nil
    }
    var currentUser : UserData?
    var isEmailIDExists : Bool{
        return (emailIDExists != nil)
    }
    
    //MARK: Properties of AWS Config
    var emailIDExists: Bool?
    var persistentUserId : String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "userId")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: "userId")
        }
    }
    
    // Fileprivate variables to configure connection to AWS
    
    fileprivate (set) var credentialsProvider: AWSCognitoCredentialsProvider?
    fileprivate static var sharedInstance: AWSConfig?
    
    // Below code is used when app needs to access local device for uploads and dloads
    
    fileprivate var deviceDirectoryForUploads: URL?
    fileprivate var deviceDirectoryForDownloads: URL?
    
    // MARK: Functions
    
    static func defaultService() -> RemoteService {
        if sharedInstance == nil {
            sharedInstance = AWSConfig()
            sharedInstance!.configure()
        }
        return sharedInstance!
    }
    
    func configure(){
        //AWS sync-up - Identity Provider configuration
        
         credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: AWSConstants.COGNITO_REGIONTYPE,
            identityPoolId: AWSConstants.COGNITO_IDENTITY_POOL_ID)
        
        let configuration = AWSServiceConfiguration(
            region: AWSConstants.DEFAULT_SERVICE_REGION,
            credentialsProvider: credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration

    }
    
    // Save information into DynamoDB
    func saveAWSUser(user : AWSUser, completion: @escaping ErrorBlock){
        precondition(user.userId != nil, "user object must have a user ID to save")
        
        // use object mapper of Dynamo DB to save user Data
        let mapper =  AWSDynamoDBObjectMapper.default()
        
        // Create task to store the information in DynamoDB
        let saveToDBTask: AWSTask = mapper.save(user)
        print(user)
        
        saveToDBTask.continue({ (task) -> AnyObject? in
            completion(task.error as NSError?)
            return nil
        })
    }
    
    //MARK:  Confirm to Method signatures in protocol Remote Service
    
    func createCurrentUser(userData: UserData?, completion: @escaping ErrorBlock) {
        precondition(currentUser == nil, "Current user should not exist to create a new user")
        precondition(userData?.userId == nil , "User ID should not exist as it gets created automatically in AWS Cognito")
//        precondition(persistentUserId == nil, "Persistent user ID should not exist yet")
        
        guard let credentialsProvider = credentialsProvider else {
            preconditionFailure("No identity provider available, did you forget to call configure() before using AWS Config?")
        }
        
        // This covers the scenario that an app was deleted and later reinstalled.
        // The goal is to create a new identity and a new user profile for this use case.
        // By default, Cognito stores a Cognito identity in the keychain.
        // This identity survives app uninstalls, so there can be an identity left from a previous app install.
        // When we detect this scenario we remove all data from the keychain, so we can start from scratch.
//        if credentialsProvider.identityId != nil {
//            credentialsProvider.clearKeychain()
//            assert(credentialsProvider.identityId == nil)
//        }
        
        //Create a new Cognito Identity
        let newIdentityTask : AWSTask = credentialsProvider.getIdentityId()
        newIdentityTask.continue ({ (task) -> AnyObject? in
            if let error = task.error{
                completion(error as NSError?)
            }else{
                // New cognito ID has been created successfully - Now create a new empty object for AWSUser
                var newUser = AWSUser()!
                
                //copy the user Data into the newUser object 
                if let userData = userData{
                    newUser.updateWithData(userData)
                }
                // Create a unique ID for the new User
                newUser.userId = NSUUID().uuidString
                
                self.queryAWSUser(userData: newUser, completion: { (error) in
                    if let error = error {
                        completion(error)
                    }else{
                        // Save the data in AWS
                        self.saveAWSUser(user: newUser){ (error) -> Void in
                            if let error = error {
                                completion(error)
                            }else{
                                print("NEW USER DATA SAVED SUCCESSFULLY")
                                // The data has been successfully saved on AWS
                                // set the local instances
                                self.currentUser = newUser
                                self.persistentUserId = newUser.userId
                                completion(nil)
                            }
                        }
                    }
                })
                

            }
            return nil
        })
        
    }
    
    func updateCurrentUser(userData: UserData?, completion: @escaping ErrorBlock) {
        guard var currentUser = currentUser else {
            preconditionFailure("currentUser should already exist when updateCurrentUser() is called")
        }
        precondition(userData?.userId == nil || userData?.userId == currentUser.userId, "Updating current user with a different userId is not allowed")
        precondition(persistentUserId != nil, "A persistent userId should exist")
        
        // create a new empty user
        var updatedUser = AWSUser()!
        // apply the new userData
        updatedUser.updateWithData(userData!)
        // restore the userId of the current user
        updatedUser.userId = currentUser.userId
        
        // If there are no changes, there is no need to update.
        if updatedUser.isEqualTo(currentUser) {
            completion(nil)
            return
        }
        
        self.saveAWSUser(user: updatedUser) { (error) -> Void in
            if let error = error {
                completion(error)
            }else{
                // Here we can be certain that the user was saved on AWS, so we update the local user property
                currentUser.updateWithData(updatedUser)
                completion(nil)
            }
        }
    }
    
    func fetchCurrentUser(completion: @escaping UserDataBlock) {
        precondition(persistentUserId != nil, "A persistent userId should exist")
        
        // Task to fetch the DynamoDB data
        let mapper = AWSDynamoDBObjectMapper.default()
        let loadFromDynamoDBTask: AWSTask = mapper.load(AWSUser.self, hashKey: persistentUserId!, rangeKey: nil)
        
        // Download the data from DynamoDB
        loadFromDynamoDBTask.continue( { (dynamoTask) -> AnyObject? in
            if let error = dynamoTask.error {
                completion(nil, error as NSError?)
            }
            else{
                if let user = dynamoTask.result as? AWSUser{
                    if var currentUser = self.currentUser{
                    currentUser.updateWithData(user)
                    } else{
                        self.currentUser = user
                    }
                    completion(user, nil)
                } else {
                    // should probably never happen
//                    assertionFailure("No userData and no error, why?")
                    completion(nil, nil)
                }

            }
            return nil
        })
    }
    
    // Query information from DynamoDB
    func queryAWSUser(userData : UserData?, completion: @escaping ErrorBlock) {
        precondition(userData?.userId != nil, "user object must have a user ID to save")
        
        // Create task to retrive the information from DynamoDB
        let scanner = AWSDynamoDBScanExpression()
        scanner.limit = 10
        scanner.projectionExpression = "emailId"
        
//        let queryExpression = AWSDynamoDBQueryExpression()
//        let attributeKey = userData?.userId
//        
////        queryExpression.indexName = "emailId-index"
//        queryExpression.projectionExpression = "emailId"
//        queryExpression.keyConditionExpression = "userId = :userId"
//        queryExpression.expressionAttributeValues = [":userId" : attributeKey as Any]
        
        // use object mapper of Dynamo DB to save user Data
        let mapper =  AWSDynamoDBObjectMapper.default()
        
        mapper.scan(AWSUser.self, expression: scanner).continue(with: AWSExecutor.mainThread(), with: { (task) -> AnyObject? in
            if(task.error != nil) {
                completion(task.error as NSError?)
            }else{
                if(task.result != nil){
                    let tableRow = task.result! as AWSDynamoDBPaginatedOutput
                    for (items) in tableRow.items as! [AWSUser]{
                        if(items.emailId == userData?.emailId){
                            // Email ID already exist in DB
                            self.emailIDExists = true
                            print("emailId already exists")
                        }
                        
                    }
                }
                completion(nil)
            }
            return nil
        })
    }
}
