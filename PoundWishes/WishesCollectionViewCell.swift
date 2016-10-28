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

    //MARK - Public API
    var wishesLoad: WishesDataSource!{
        didSet{
            updateUI()
        }
    }
    func updateUI(){
        textArea?.text! = wishesLoad.description
        cellImage?.image = wishesLoad.cellImage
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    @IBAction func donateButtonClicked(_ sender: AnyObject) {
        //add button action
    }
    
}
