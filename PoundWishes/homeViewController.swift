//
//  homeViewController.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 10/1/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
//MARK : Properties
    @IBOutlet weak var open: UIBarButtonItem!
    @IBOutlet weak var homeLabel: UILabel!
        var color = UIColor.green
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeFrame: UIView!
    @IBOutlet weak var textArea1: UITextView!
    @IBOutlet weak var frameDonateButton: UIButton!
    @IBOutlet weak var frameReadMoreButton: UIButton!
    @IBOutlet weak var frameProgressBar: UIProgressView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set Menu Bar and Gesture Recognizer
        setMenuGesture()
        
        //set logo on nav bar
        setLogoNavBar()
        
        //configure outlets
       outletConfig()
        
        
        // change tint color
        changeTintColor()
        
        //set frame items
        loadFrame()
    }
    
    // viewDid Load functions
    func setMenuGesture(){
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func loadFrame(){
        //set image
        let frameImage = UIImage(named: "wish3")
        homeImage.image = frameImage
        //set label1
        textArea1.text = "Sugar Puncture Wounds Throughout Body and Severe Infection"
        
        //set Label1
        label1.text = "Hostess"
        
        //set Label2
        label2.text = "2 surgeries  + Rehabilitation"
        
        //set Label3
        let text: NSString = "$100/$3000"
        let attributedText: NSMutableAttributedString = NSMutableAttributedString(string: text as String)
    
        attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)], range: NSRange(location: 1, length: 4))
        label3.attributedText = attributedText
        
//        set Label4
        label4.text = "raised"
        
        //set progressBar
        
    }
    
    func setLogoNavBar(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "pw_vertical")
        imageView.image = logo
        self.navigationItem.titleView? = imageView
    }
    
    func changeTintColor(){
                self.navigationController?.navigationBar.tintColor = color
    }
        // configure outlets
    func outletConfig(){

        //homeLabel  Label
//        homeLabel.layer.cornerRadius = 2
//        homeLabel.layer.borderWidth = 1

        
        // homeImage layout
//        homeImage.layer.masksToBounds = false
//        homeImage.layer.shadowRadius = 1.0
//        homeImage.layer.shadowColor = UIColor.black.cgColor
//        homeImage.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//        homeImage.layer.shadowOpacity = 1.0
        // border details
//        homeImage.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        homeImage.layer.borderWidth = 1.0
//        homeImage.layer.cornerRadius = 2
        
        // homeFrame layout
        homeFrame.layer.backgroundColor = UIColor.white.cgColor
        homeFrame.layer.masksToBounds = false
        homeFrame.layer.shadowRadius = 2.0
        homeFrame.layer.shadowColor = UIColor.black.cgColor
        homeFrame.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        homeFrame.layer.shadowOpacity = 2.0
        // border details
//        homeFrame.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        homeFrame.layer.borderWidth = 1.0
//        homeFrame.layer.cornerRadius = 2
    
        // textArea1 layout
//        textArea1.layer.backgroundColor = UIColor.white.cgColor
//        textArea1.layer.masksToBounds = false
//        textArea1.layer.shadowRadius = 1.0
//        textArea1.layer.shadowColor = UIColor.black.cgColor
//        textArea1.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//        textArea1.layer.shadowOpacity = 1.0
        // border details
//        textArea1.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        textArea1.layer.borderWidth = 1.0
//        textArea1.layer.cornerRadius = 2
        
        // textArea2 layout
//        textArea2.layer.backgroundColor = UIColor.white.cgColor
//        textArea2.layer.masksToBounds = false
//        textArea2.layer.shadowRadius = 1.0
//        textArea2.layer.shadowColor = UIColor.black.cgColor
//        textArea2.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//        textArea2.layer.shadowOpacity = 1.0
        // border details
//        textArea2.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        textArea2.layer.borderWidth = 1.0
//        textArea2.layer.cornerRadius = 2
    
    }
    
    // MARK: Button actions
    @IBAction func frameDonateButtonClicked(_ sender: AnyObject) {
        //action code here
    }
    
    @IBAction func frameReadMoreButtonClicked(_ sender: AnyObject) {
        //action code here
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
    }
}
