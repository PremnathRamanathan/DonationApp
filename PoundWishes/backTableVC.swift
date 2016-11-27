//
//  backTableVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 10/2/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import Foundation

class backTableVC: UITableViewController {

    
// array for table inputs
    var tableArray = [String]()
    
    override func viewDidLoad() {
        // set tableArray data
        setTableArray()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // set values to cells in the table
        let cell = tableView.dequeueReusableCell(withIdentifier: tableArray[indexPath.row], for: indexPath)
        return cell
    }

    
    func setTableArray() {
        tableArray = ["Logo","Home", "Login", "Register", "Wishes","FAQ","SuccessStories", "AboutUs"]
    }
}
