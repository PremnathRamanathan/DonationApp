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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
