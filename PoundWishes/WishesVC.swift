//
//  WishesVC.swift
//  PoundWishes
//
//  Created by Ramanathan,Premnath on 10/17/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class WishesVC: UIViewController, UICollectionViewDataSource {

    //MARK - OUtlets
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var collections: UICollectionView!
    @IBOutlet weak var SegmentedButton: UISegmentedControl!
    
    @IBOutlet weak var currentUserProfileImage: UIImageView!
    @IBOutlet weak var currentUserProfileButton: UIButton!
    
    var color = UIColor.green
    
    //UICollectionViewDataSource
    public var wishes = WishesDataSource.createWishes()
    public var recentlyStartdWishes = WishesDataSource.recentlyStartedWishes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set Menu Bar and Gesture Recognizer
        setMenuGesture()
        
        //set logo on nav bar
        setLogoNavBar()
        
        // change tint color
        self.navigationController?.navigationBar.tintColor = color
    }
    private struct Storyboard{
        static let cellIdentifier = "Wishes Cell"
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     var returnValue = 0
        switch SegmentedButton.selectedSegmentIndex
        {
        case 0:
            returnValue = wishes.count
            break
        case 1:
            returnValue = recentlyStartdWishes.count
            break
        default:
            returnValue = wishes.count
            break
        }
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath as IndexPath) as! WishesCollectionViewCell
        
        switch SegmentedButton.selectedSegmentIndex
        {
        case 0:
            cell.wishesLoad = self.wishes[indexPath.item]
            break
        case 1:
            cell.wishesLoad = self.recentlyStartdWishes[indexPath.item]
            break
        default:
            cell.wishesLoad = self.wishes[indexPath.item]
            break
        }
        return cell
    }
    // viewDid Load functions
    func setMenuGesture(){
        menu.target = self.revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        if revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func setLogoNavBar(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFill
        let logo = UIImage(named: "pw_vertical")
        imageView.image = logo
        navigationItem.titleView = imageView
    }

//Mark - IBActions
    @IBAction func SegmentedControlButtons(_ sender: UISegmentedControl) {
        
        switch SegmentedButton.selectedSegmentIndex
        {
        case 0:
            //code for almost funded
            self.collections.reloadData()
        case 1:
            //code for Recently Started
            self.collections.reloadData()
        default:
            break;
        }
    }
    
}
