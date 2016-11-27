//
//  DetailWishesVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/1/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class DetailWishesVC: UIViewController {
//Markers : IBOutlets
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PoundImage: UIImageView!
    @IBOutlet weak var PoundInfoText: UITextView!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var PoundInfo2Text: UITextView!
    
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var DonateButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //back button
//        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
//        navigationItem.leftBarButtonItem = backButton
//        _ = navigationController?.popToRootViewController(animated: true)
        
        // format views and buttons
        outletConfig()
        
        //load data
        loadDataIntoView()
    }
    // viewDid Load functions
    
    //config outlets
    func outletConfig(){

        // poundInfoText layout
        PoundInfoText.layer.masksToBounds = false
        PoundInfoText.layer.shadowRadius = 1.0
        PoundInfoText.layer.shadowColor = UIColor.black.cgColor
        PoundInfoText.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        PoundInfoText.layer.shadowOpacity = 1.0
            // border details
//        PoundInfoText.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        PoundInfoText.layer.borderWidth = 1.0
//        PoundInfoText.layer.cornerRadius = 2
        
        // poundImage layout
//        PoundImage.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        PoundImage.layer.borderWidth = 1.0
//        PoundImage.layer.cornerRadius = 2
            //shadow details
//        PoundImage.layer.masksToBounds = false
        PoundImage.layer.shadowRadius = 1.0
        PoundImage.layer.shadowColor = UIColor.black.cgColor
        PoundImage.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        PoundImage.layer.shadowOpacity = 1.0
        
        // PoundInfo2Text layout
//        PoundInfo2Text.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        PoundInfo2Text.layer.borderWidth = 1.0
//        PoundInfo2Text.layer.cornerRadius = 2
        //shadow details
        PoundInfo2Text.layer.masksToBounds = false
        PoundInfo2Text.layer.shadowRadius = 1.0
        PoundInfo2Text.layer.shadowColor = UIColor.black.cgColor
        PoundInfo2Text.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        PoundInfo2Text.layer.shadowOpacity = 1.0

        // counterLabel layout
//        counterLabel.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        counterLabel.layer.borderWidth = 1.0
//        counterLabel.layer.cornerRadius = 2

        
        // detailText layout
//        detailText.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
//        detailText.layer.borderWidth = 1.0
//        detailText.layer.cornerRadius = 2
        //shadow details
        detailText.layer.shadowRadius = 1.0
        detailText.layer.shadowColor = UIColor.black.cgColor
        detailText.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        detailText.layer.shadowOpacity = 2.0
    }
    
    //load data in the view
    func loadDataIntoView(){
        NameLabel.text = "Carley"
        let count = 10
        let image = UIImage(named: "wish1")
        PoundImage.image = image
        PoundInfoText.text = "SEVERE NEGLECT"
        PoundInfo2Text.text = "Breed: Great Dane  \t Color: Salt & Pepper \nSex: Female \nSize: Extra Large \t Age: Adult"
    progressbar.setProgress(0.4,animated: true)
        counterLabel.text = count.description + " SHARES"
        detailText.text = "Carley is a 5-year-old Great Dane.  She came to our rescue from Hood Co. Animal Control. The ACO seized Carley from her home, due to her poor condition.  This is a severe neglect case, because it's obvious that Carley has been starved for a long while. If Carley would not have been taken by the authorities, she would have died of starvation."+"\n"+"Carley is extremely under weight and is in need of immediate veterinary care.  Her immune system has been compromised and she is battling a severe case of staph infection.  Her feet are swollen.  She could barely stand up.  Her hair is falling off, she's running fever and her heart rate is 190.  The vet said it's the worse case of neglect he has seen."+"\n"+"Carley needs lots of medications to treat her skin condition.  She needs pain and anti-inflammatory meds, high dose of antibiotics, medicated baths, itch relief sprays, not to forget, lots of good quality food.   Carley also needs to be seen by a heart specialist to determine the cause for the high heart rate."+"\n"+"In spite of Carley's horrible shape, she loves people, especially those who pet her and scratch her itchy skin. Carley is extremely sweet and loving.  She is good with all people, kids, other dogs, as well as cats.  Once fully recovered, she will make an awesome family pet."
    }
    
//Mark: Action items

    @IBAction func donateButtonClicked(_ sender: AnyObject) {
    }
}
