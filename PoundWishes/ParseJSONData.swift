//
//  ParseJSONData.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 12/12/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info :  This file is used for downloading user data from the database and parse it in JSON format and assign it to protocol which will be called by ViewController to display the content to the user

import Foundation

protocol ParseJSONProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class ParseJSONData: NSObject, URLSessionDataDelegate{
    
    // Properties
    
    weak var delegate : ParseJSONProtocol!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "https://poundwishes.com/ios/test.php"  // provide path of the required php file to access the db
    
    
    func downloadData(){
        let url: URL = NSURL(string: urlPath)! as URL
        var session: URLSession
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: url)
        
        task.resume()
    }
    
    // Append the data from DB in NSmutableData for further processing
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data)
    }
    
    //CHeck if Data was downloaded from Database successfully
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("Failed to download data from database : \(error)")
        }
        else{
            print("Data Downloaded")
            self.parseJSON() // Parse the data into JSON format for further processing.
        }
    }
    
    // Method to parse the data from Database into JSON format
    func parseJSON(){
        var jsonResult : NSMutableArray = NSMutableArray()
        
        do{
            // Parse using JSON Serialization with Reading options.
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableArray
        } catch let error as NSError{
            print(error)
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let info : NSMutableArray = NSMutableArray()
        
        for i in  (0..<jsonResult.count) {
            jsonElement = jsonResult[i] as! NSDictionary
            let userInfo = DBFetchDataSource()
            
            //Following code ensures none of the JSON ELement values are nil through optional binding
            if let email = jsonElement["email"] as? String, let firstname = jsonElement["firstname"] as? String, let lastname = jsonElement["lastname"] as? String, let role = jsonElement["role"] as? String {
                userInfo.email = email
                userInfo.firstname = firstname
                userInfo.lastname = lastname
                userInfo.role = role
            }
            
            info.add(userInfo)
            
        }
        // launch process asynchronously in main thread
        DispatchQueue.main.async { () -> Void in
            self.delegate.itemsDownloaded(items: info)
        }
    }
    
}
