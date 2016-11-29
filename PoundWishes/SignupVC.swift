//
//  SignupVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    fileprivate var emailID: String = ""
    
//MARK: properties
    @IBOutlet weak var confirmEmailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpwdTF: UITextField!
    @IBOutlet weak var emailTF1: UITextField!
    @IBOutlet weak var menuBar2: UIBarButtonItem!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userRegistrationLabel: UILabel!
    @IBOutlet weak var ConfPwdLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var confEmailLabel: UILabel!
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
        menuBar2.target = self.revealViewController()
        menuBar2.action = #selector(SWRevealViewController.revealToggle(_:))
        
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

//MARK: UIButton Actions
    @IBAction func ContinueButton(_ sender: Any) {
        // Sign up logic
            //Validate field level 
        // Get the values entered in the fields
        let email = emailTF1.text;
        let confirmEmail = confirmEmailTF.text;
        let password = passwordTF.text;
        let confirmPassword = confirmpwdTF.text;
        
        // check for empty fields
        let isEmailEmpty = checkIfEmailEmpty(value: email!)
        let isConfirmEmailEmpty =  checkIfConfirmEmailEmpty(value: confirmEmail!)
        let isPasswordEmpty =  checkIfPasswordEmpty(value: password!)
        let isConfirmPasswordEmpty =  checkIfConfirmPasswordEmpty(value: confirmPassword!)
        
        // Validate empty check
        if(isEmailEmpty){
            // display alert message
            displayAlertMessage(userMessage: "Email field is mandatory ");
        }
        
        if(isConfirmEmailEmpty){
            // display alert message
            displayAlertMessage(userMessage: "confirm email  field is mandatory ");
        }
        
        if(isPasswordEmpty){
            // display alert message
            displayAlertMessage(userMessage: "password field is mandatory");
        }
        
        if(isConfirmPasswordEmpty){
            // display alert message
            displayAlertMessage(userMessage: "confirm password field is mandatory");
        }
        
        // check if emails match and check if passwords match
        if(email != confirmEmail){
            // display alert message
            displayAlertMessage(userMessage: "email address and confirm email address do not match")
        }
        // check if passwords match
        if(password != confirmPassword){
            // display alert message
            displayAlertMessage(userMessage: "password and confirm password do not match")
        }
        
        if(!self.emailID.isEmpty || (RemoteServiceControl.getDefaultService().currentUser != nil)){
            print("user already as a user ID and emailID : ", self.emailID)
            self.displayAlertMessage(userMessage: "This device already has a user account.Try logging in")
        }
        else
        {
            
        print("Creating new user !")
        //create current user
        var userData = UserDatas()
        userData.emailId = email
        userData.password = password

        RemoteServiceControl.getDefaultService().createCurrentUser(userData: userData){ (error) -> Void in
            if let error = error {
                userData.emailId = nil
                userData.password = nil
                print(error)
            self.displayAlertMessage(userMessage: "EmailID already exists.Please try using different emailID")
            }else{
                self.displayAlertMessage(userMessage: "User Registration successful")
            }
        }
            
        // Update email Id and password in new user
//        var userData = UserDatas()
//        userData.updateWithData(RemoteServiceControl.getDefaultService().currentUser!)
//        userData.emailId = email
//        userData.password = password
//        RemoteServiceControl.getDefaultService().updateCurrentUser(userData: userData, completion: { (error) in
//            if let error = error {
//                print(error)
//            }else{
//                print("New User data added in AWS")
//            }
//        })
            
        }
        
    }
    // Check If Field is empty?
    func checkIfEmailEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    func checkIfConfirmEmailEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    func checkIfPasswordEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    func checkIfConfirmPasswordEmpty(value: String) -> Bool{
        return value.isEmpty
    }
    
    
    // Store the information
    
    
    
    // Display alert message function
    func displayAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

    @IBAction func gotoLoginButton(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
    }


}
