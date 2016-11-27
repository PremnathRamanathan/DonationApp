//
//  FAQTableViewCell.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/17/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UITextView!
    @IBOutlet weak var FAQ1: UILabel!
    @IBOutlet weak var FAQ2: UILabel!

    //MARK - Public API
    var FAQ: FAQDataSource!{
        didSet{
            updateUI()
        }
    }
    func updateUI(){
        question.text = FAQ.Label1
        answer.text = FAQ.textArea
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
