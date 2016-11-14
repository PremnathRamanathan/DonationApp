//
//  SignupVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
//MARK: properties
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpwdTF: UITextField!
    @IBOutlet weak var menuBar2: UIBarButtonItem!
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
        menuBar2.target = self.revealViewController()
        menuBar2.action = #selector(SWRevealViewController.revealToggle(_:))
        
        if revealViewController() != nil {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func setLogoNavBar(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "PoundWishes_logo2")
        imageView.image = logo
        navigationItem.titleView = imageView
    }
    
    func changeTintColor(){
        self.navigationController?.navigationBar.tintColor = color
    }

//MARK: UIButton Actions
    @IBAction func signupButton(_ sender: UIButton) {
    }
    @IBAction func gotoLoginButton(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
    }


}
