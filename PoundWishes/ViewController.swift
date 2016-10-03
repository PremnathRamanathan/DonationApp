//
//  ViewController.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 9/28/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//MARK: Properties
    @IBOutlet var userNameLabel: UIView!
    var color = UIColor.blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change tint color
        self.navigationController?.navigationBar.tintColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        Thread.sleep(forTimeInterval: 5.0)
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }

}

