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
        menuBar2.target = self.revealViewController()
        menuBar2.action = #selector(SWRevealViewController.revealToggle(_:))

        
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

//MARK: UIButton Actions
    @IBAction func signupButton(_ sender: UIButton) {
    }
    @IBAction func gotoLoginButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
