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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        Thread.sleep(forTimeInterval: 5.0)
        self.performSegue(withIdentifier: "SWRevealView", sender: self)
    }

}

