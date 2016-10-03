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
    @IBOutlet weak var menuBar: UIBarButtonItem!
    var color = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBar.target = self.revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
