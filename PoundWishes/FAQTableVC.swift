//
//  FAQTableVC.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/16/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class FAQTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//MARK:  IBOutlets
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    //set array for table elements
    var tableElements = [FAQDataSource]()

    // viewDid Load functions
    func setMenuGesture(){
        menuBarButton.target = self.revealViewController()
        menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set Menu Bar and Gesture Recognizer
        setMenuGesture()
        
        //set logo on nav bar
        setLogoNavBar()
        
        //table view
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.tableView.register(FAQTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableElements = FAQDataSource.createFAQs()
        self.tableView.reloadData()
    }


    // MARK: - Table view data source
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableElements.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! FAQTableViewCell

        // Configure the cell...
        let FAQ = self.tableElements[indexPath.row]
        cell.FAQ = FAQ

        return cell
    }
    
   //MARK: Action items
}
