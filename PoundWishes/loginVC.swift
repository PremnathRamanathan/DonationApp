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
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    
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
        // Get the values entered in the fields
        let username = usernameTF.text;
        let password = passwordTF.text;
        
        // check for empty fields
        let isusernameEmpty = checkIfusernameEmpty(value: username!)
        let isPasswordEmpty =  checkIfPasswordEmpty(value: password!)
        
        // Validate empty check
        if(isusernameEmpty){
            // display alert message
            displayAlertMessage(userMessage: "username field is mandatory ");
        }
        
        if(isPasswordEmpty){
            // display alert message
            displayAlertMessage(userMessage: "password field is mandatory ");
        }
        
        if(RemoteServiceControl.getDefaultService().hasCurrentUserIdentity){
//            var userData = UserDatas()
//            userData.updateWithData(RemoteServiceControl.getDefaultService().currentUser!)
//            userData.emailId = username
//            userData.password = password
            
            // validate credentials 
            var currentUserData = RemoteServiceControl.getDefaultService().currentUser!
            if(currentUserData.emailId == username && currentUserData.password == password){
                self.displayUserAlertMessage(userMessage: "Welcome back " + username!)
                
            }else{
                self.displayAlertMessage(userMessage: "Username and password do not match ")
            }
            
        }else{
            preconditionFailure("CurrentUser must be available")
        }

    }
    @IBAction func signUpButton(_ sender: UIButton) {
        
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
    }
    // Check If Field is empty?
    func checkIfusernameEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    func checkIfPasswordEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    
    // Display alert message function
    func displayAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

    func displayUserAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
//            {action in self.performSegue(withIdentifier: "home", sender: self) })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "home"){
            let vc = segue.destination as! UINavigationController
            let dvc = vc.topViewController as! homeViewController
            dvc.navigationItem.title = "Home"
        }
    }

}
