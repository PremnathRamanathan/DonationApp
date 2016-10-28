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
        menuBar.target = self.revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        //set logo on nav bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        let logo = UIImage(named: "logo2")
        imageView.image = logo
        navigationItem.titleView = UIImageView(image: logo)
        
        // change tint color
        self.navigationController?.navigationBar.tintColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: UIButton actions
    
    @IBAction func loginButton(_ sender: UIButton) {
        //Authentication code here
    }
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    

}
