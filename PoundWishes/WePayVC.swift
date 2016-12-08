//
//  WePayVC.swift
//  PoundWishes
//
//  Created by Vishwanath Upadhayay on 12/6/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import UIKit

class WePayVC: UIViewController {

    @IBOutlet weak var wepay: UIImageView!
    @IBOutlet weak var cardnumber: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ziptext: UITextField!
    @IBOutlet weak var zip: UILabel!
    @IBOutlet weak var addresstext: UITextField!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var cardtext: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var CVVtext: UITextField!
    @IBOutlet weak var CVV: UILabel!
    @IBOutlet weak var citytext: UITextField!
    @IBOutlet weak var city: UILabel!
    
    override func viewDidLoad() {
       
       
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
