//
//  WishesDataSource.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 10/17/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class WishesDataSource{
    
    //MARK - Public API
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var cellImage: UIImage!
    
    init(title: String,description: String, cellImage: UIImage!) {
        self.title = title
        self.description = description
        self.cellImage = cellImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    //Data 
    static func createWishes()-> [WishesDataSource]{
        return [WishesDataSource(title: "wish1", description: "Wish1 - Bubbles came into rescue through owner surrender. We were told that she had infected glands from rubbing herself on rosebushes. Her owners had been treating her, but her high medical bills soon became too much. Once she was with us and we could evaluate her ourselves, we discovered she had many other troubling medical issues. She has been living with an inverted tail and a 2 fistula that excretes stool. Bubbles has numerous pustules and oozing wounds over her entire hind-end and there were maggots in some of her sores. The scar tissue that has built up had created a hard, thick shell beneath her fur that reveals how long she has been struggling with these problems."+"   "+"Currently, she is being treated with antibiotics to try to clear up the infection and she has baths several times a day. She has also had a few pustules lanced in an effort to expedite her healing. Once the infection is cleared up she will need at least one if not more surgeries. They will need to correct the fistula and remove the tail that has been causing her so much grief."+"  "+"Her behavior and temperament is amazing - thru everything she will just stand there and let you clean everything. She loves treats and just wants to be with you. She gets along well with other dogs. We are very excited to get her infection cleared and her surgeries done so she can go on to be loved forever.", cellImage: UIImage(named: "wish1")!),
        WishesDataSource(title: "wish2", description: "Wish2", cellImage: UIImage(named: "wish2")!),
         WishesDataSource(title: "wish3", description: "Wish3", cellImage: UIImage(named: "wish3")!),]
    }
    static func recentlyStartedWishes()-> [WishesDataSource]{
        return [WishesDataSource(title: "started1", description: "started1", cellImage: UIImage(named: "wish2")!),
                WishesDataSource(title: "started2", description: "started2", cellImage: UIImage(named: "wish3")!),
                WishesDataSource(title: "started3", description: "started3", cellImage: UIImage(named: "wish1")!),]
    }
}
