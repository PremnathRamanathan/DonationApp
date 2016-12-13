//
//  WishesDataSource.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 10/17/16.
//  Copyright © 2016 Group7. All rights reserved.
//
// File Info :  This file acts as teh data source for Wishes / Campaigns

import UIKit

class WishesDataSource{
    
    //MARK - Public API
    var title = ""
    var Label1 = ""
    var Label2 = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var cellImage: UIImage!
    var progressLabel = ""
    
    init(title: String,Label1: String,Label2: String, description: String, cellImage: UIImage!, progressLabel: String) {
        self.title = title
        self.Label1 = Label1
        self.Label2 = Label2
        self.description = description
        self.cellImage = cellImage
        numberOfMembers = 1
        numberOfPosts = 1
        self.progressLabel = progressLabel
    }
    
    //Data 
    static func createWishes()-> [WishesDataSource]{
        return [WishesDataSource(title: "wish1", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "\nBubbles came into rescue through owner surrender.", cellImage: UIImage(named: "wish1")!, progressLabel: "$1,440.00 of $5,000.00 raised"),
        WishesDataSource(title: "wish2", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "Wish2", cellImage: UIImage(named: "wish2")!, progressLabel: "$2,200.00 of $4,000.00 raised"),
        WishesDataSource(title: "wish3", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "Wish3", cellImage: UIImage(named: "wish3")!, progressLabel: "$6,744.00 of $6,000.00 raised")]
    }
    static func recentlyStartedWishes()-> [WishesDataSource]{
        return [WishesDataSource(title: "started1", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "started1", cellImage: UIImage(named: "wish2")!,progressLabel: "$3,030.00 of $7,000.00 raised"),
                WishesDataSource(title: "started2", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "started2", cellImage: UIImage(named: "wish3")!, progressLabel: "$500.00 of $2,000.00 raised"),
                WishesDataSource(title: "started3", Label1: "Wish1", Label2: "Beverly Hills, CA", description: "started3", cellImage: UIImage(named: "wish1")!, progressLabel: "$30.00 of $750.00 raised"),]
    }
}
