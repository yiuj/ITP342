//
//  StartViewController.swift
//  Week3
//
//  Created by Student on 9/5/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // Class attributes - variables
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        if (self.nameTF.text?.count)! > 0 {
            self.messageLabel.text = "Fight on, \(self.nameTF.text)!"
        } else {
            messageLabel.text = "Fight On!"
        }
    }
    // Class methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
//    @IBAction func textfieldDone(_ sender: UITextField) {
//        sender.resignFirstResponder()
//    }

    @IBAction func backgroundButtonTouched(_ sender: UIButton) {
        self.nameTF.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

