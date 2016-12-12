//
//  WePayVC.swift
//  PoundWishes
//
//  Created by Vishwanath Upadhayay on 12/6/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class WePayVC: UIViewController {

    @IBOutlet weak var wepay: UIImageView!
    @IBOutlet weak var cardnumber: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ziptext: UITextField!
    @IBOutlet weak var zip: UILabel!
    @IBOutlet weak var addresstext: UITextField!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var cardtext: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var CVVtext: UITextField!
    @IBOutlet weak var CVV: UILabel!
    @IBOutlet weak var citytext: UITextField!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var color = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set Menu Bar and Gesture Recognizer
        setMenuGesture()
        
        
        //set logo on nav bar
        setLogoNavBar()
        
        // change tint color
        changeTintColor()

    }
    // viewDid Load functions
    func setMenuGesture(){
        menu.target = self.revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        if revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func setLogoNavBar(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "pw_vertical")
        imageView.image = logo
        navigationItem.titleView = imageView
    }
    
    func changeTintColor(){
        self.navigationController?.navigationBar.tintColor = color
    }

}
