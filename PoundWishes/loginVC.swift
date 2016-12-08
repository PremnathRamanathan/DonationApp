//
//  loginVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/29/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

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
        
        // Set Login func for Facebook
        configureFBButton()
        configureFBLogin()
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
    
    func configureFBButton(){
        let fbloginButton = UIButton(type: .custom)
        fbloginButton.backgroundColor = UIColor.blue
        fbloginButton.setTitle("FB Login", for: .normal)
        fbloginButton.frame = CGRect(x: 130, y: 270, width:100 , height: 30)
        // Handle clicks on the button
        fbloginButton.addTarget(self, action: #selector(self.fbLoginButtonClicked), for: .touchUpInside)
        self.view.addSubview(fbloginButton)
    }
    
    func configureFBLogin(){
        
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            let fbUserID = accessToken.userId
            print(fbUserID!)
        }
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
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                    {action in self.performSegue(withIdentifier: "home", sender: nil)})
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

    
    func segueToHome(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "home")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Once the button is clicked, show the login dialog
    @objc func fbLoginButtonClicked() {
        if(RemoteServiceControl.getDefaultService().hasCurrentUserIdentity){
            print("User session exists")
            displayAlertMessage(userMessage: "User session exists. Please logout before trying to Login")

        }
        else{
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { (LoginResult) in
            switch LoginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print(grantedPermissions,declinedPermissions)
                print(accessToken.appId, accessToken.userId!)
            }
        }
        }
    }
    
}
