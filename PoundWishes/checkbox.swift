//
//  checkbox.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class checkbox: UIButton {
// images
    let checkedImage = UIImage(named: "checked_checkbox")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked_checkbox")! as UIImage
    
//bool property
    var isChecked: Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, for: .normal)
            }else{
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    // add action listener
    override func awakeFromNib() {
//        self.addTarget(self, action: "buttondClicked:", for: UIControlEvents.touchUpInside)
//        self.isChecked = false
    }
    // button click control
    func buttondClicked(sender: UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
}
