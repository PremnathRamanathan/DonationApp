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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //set logo on nav bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
//        imageView.contentMode = .scaleAspectFit
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
    
}
