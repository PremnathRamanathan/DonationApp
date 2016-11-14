//
//  WishesCollectionViewCell.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 10/17/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class WishesCollectionViewCell: UICollectionViewCell {
    //MARK - Outlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellProgress: UIProgressView!
    @IBOutlet weak var cellDonateButton: UIButton!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var ProgressLabel: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!

    //MARK - Public API
    var wishesLoad: WishesDataSource!{
        didSet{
            updateUI()
            outletConfig()
        }
    }
    func updateUI(){
        Label1?.text! = wishesLoad.Label1
        Label2?.text! = wishesLoad.Label2
        textArea?.text! = wishesLoad.description
        cellImage?.image = wishesLoad.cellImage
        ProgressLabel?.text! = wishesLoad.progressLabel
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    // configure outlets
    func outletConfig(){
        //cell donate button
//        cellDonateButton.layer.cornerRadius = 2
//        cellDonateButton.layer.borderWidth = 1
//        cellDonateButton.layer.borderColor = UIColor.black.cgColor
        
        // cellImage layout
//        cellImage.layer.masksToBounds = false
//        cellImage.layer.shadowRadius = 1.0
//        cellImage.layer.shadowColor = UIColor.black.cgColor
//        cellImage.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//        cellImage.layer.shadowOpacity = 1.0
        // border details
//        cellImage.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        cellImage.layer.borderWidth = 1.0
//        cellImage.layer.cornerRadius = 2


    }
    
    
    @IBAction func donateButtonClicked(_ sender: AnyObject) {
        //add button action
    }
    
}
