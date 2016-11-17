//
//  loginVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
//MARK: Properties
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var menuBar: UIBarButtonItem!
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
        menuBar.target = self.revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        
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
    
//MARK: UIButton actions
    
    @IBAction func loginButton(_ sender: UIButton) {
        //Authentication code here
    }
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    

}
