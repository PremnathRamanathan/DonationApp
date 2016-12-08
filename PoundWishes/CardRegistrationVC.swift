//
//  CardRegistrationVC.swift
//  PoundWishes
//
//  Created by Vishwanath Upadhayay on 11/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//
import UIKit

class CardRegistrationVC: UIViewController {
    
    //MARK: IBOutlets
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
