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
    @IBOutlet weak var frameLabel1: UILabel!
    @IBOutlet weak var frameLabel2: UILabel!
    @IBOutlet weak var frameDonateButton: UIButton!
    @IBOutlet weak var frameReadMoreButton: UIButton!
    @IBOutlet weak var frameProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set Menu Bar and Gesture Recognizer
        setMenuGesture()
        
        //set logo on nav bar
        setLogoNavBar()
        
        
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
        let frameImage = UIImage(named: "wish4")
        homeImage.image = frameImage
        //set label1
        frameLabel1.text = "Sugar Puncture Wounds Throughout Body and Severe Infection"
        
        //set Label2
        frameLabel2.text = "$100 / $3000 raised"
        
        //set progressBar
    
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
    
    // MARK: Button actions
    @IBAction func frameDonateButtonClicked(_ sender: AnyObject) {
        //action code here
    }
    
    @IBAction func frameReadMoreButtonClicked(_ sender: AnyObject) {
        //action code here
    }
    
}
