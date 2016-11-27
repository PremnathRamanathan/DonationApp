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
        return [
                FAQDataSource(title: "FAQ3", Label1: "How do I setup a PoundWish?", textArea: "If you don't already have an account, set one up by clicking register in the top right corner of our home page. Choose the option for Shelter and Rescues.  Once you have an account, you will simply click \"add a pet\" and enter all the pet's details.  On the bottom of the page start the PoundWish fundraising campaign by checking the \"Activate PoundWish\" box.  Once you click 'save' your new PoundWish campaign will be active and ready to go!"),
                FAQDataSource(title: "FAQ4", Label1: "What is the difference between a PoundWish and a Weekly Wish?", textArea: "The Weekly Wish is a pet selected by our panel to be highlighted on our home page for one week.  We feature the Weekly Wish pet in one of our marketing campaigns."),
                FAQDataSource(title: "FAQ5", Label1: "Why are the Weekly Wish campaigns so successful?", textArea: "We use a combination of social and email marketing techniques to promote the Weekly Wish.  We have made these same techniques available to you on your dashboard so every PoundWish can have the same success.  Check out the 'Fundraising Made Easy' page to learn how to get the most out of your fundraising"),
                FAQDataSource(title: "FAQ6", Label1: "How are funds dispersed?", textArea: "PoundWishes mails a check directly to your organization weekly by check or direct deposit.  Check amounts will vary depending on when the donations are made in our finance cycle."),
                FAQDataSource(title: "FAQ7", Label1: "Does it cost anything to use PoundWishes?", textArea: "PoundWishes, and our marketing tools, are free to use for pet adoptions.  PoundWishes retains 10% of every donation + .99 per transaction fee paid by the donor to cover the fees charged to PoundWishes for managing the credit card processing on your behalf.  Addtionally, PoundWishes is actively investing advertising and marketing dollars to help promote your campaigns, thereby providing marketing support to successfully fund your campaigns and grow your donor base.  Our net fees after the credit card processing costs allow for us to continue to invest in maintaining and improving the site, along with advertising and marketing PoundWishes to help our shelter and rescue partners successfully achieve their fundraising goals.")]
    }

    
}
