//
//  ViewController.swift
//  YiuJonathanHW2
//
//  Created by Jonathan Yiu on 9/10/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func textFieldExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundButtonExit(_ sender: UIButton) {
        self.nameTF.resignFirstResponder()
    }
    
    @IBAction func catButtonPressed(_ sender: Any) {
        if (self.nameTF.text?.count)! > 0 {
            self.messageLabel.text = "Bad choice, \(self.nameTF.text!)! Cats are scary!"
        } else {
            messageLabel.text = "Bad choice! Cats are scary!"
        }
    }
    
    @IBAction func dogButtonPressed(_ sender: Any) {
        if (self.nameTF.text?.count)! > 0 {
            self.messageLabel.text = "Good choice, \(self.nameTF.text!)! Dogs are the best!"
        } else {
            messageLabel.text = "Good choice! Dogs are the best!"
        }
    }
    
    @IBAction func resetMessageLabel(_ sender: Any) {
        messageLabel.text = ""
        nameTF.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

