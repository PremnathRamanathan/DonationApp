//
//  FAQDataSource.swift
//  PoundWishes
//
//  Created by Upadhayay, Vishwanath on 11/16/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import Foundation
import UIKit

class FAQDataSource{
    
    //MARK - Public API
    var title = ""
    var Label1 = ""
    var textArea = ""
    
    init(title: String,Label1: String,textArea: String) {
        self.title = title
        self.Label1 = Label1
        self.textArea = textArea
    }
    
    //Data
    static func createFAQs()-> [FAQDataSource]{
        return [FAQDataSource(title: "FAQ1", Label1: "How do I setup a PoundWish?", textArea: "If you don't already have an account, set one up by clicking register in the top right corner of our home page. Choose the option for Shelter and Rescues.  Once you have an account, you will simply click \"add a pet\" and enter all the pet's details.  On the bottom of the page start the PoundWish fundraising campaign by checking the \"Activate PoundWish\" box.  Once you click 'save' your new PoundWish campaign will be active and ready to go!"),
                FAQDataSource(title: "FAQ2", Label1: "Wish1", textArea: "Beverly Hills, CA"),FAQDataSource(title: "FAQ3", Label1: "Wish1", textArea: "Beverly Hills, CA"), FAQDataSource(title: "FAQ4", Label1: "Wish1", textArea: "Beverly Hills, CA"), FAQDataSource(title: "FAQ5", Label1: "Wish1", textArea: "Beverly Hills, CA")]
    }

    
}
