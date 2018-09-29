//
//  ViewController.swift
//  YiuJonathanHW2
//
//  Created by Jonathan Yiu on 9/10/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var catButton: UIButton!
    
    @IBOutlet weak var dogButton: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBAction func textFieldExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundButtonExit(_ sender: UIButton) {
        self.nameTF.resignFirstResponder()
    }
    
    @IBAction func catButtonPressed(_ sender: Any) {
        if (self.nameTF.text?.count)! > 0 {
             
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
        
        questionLabel.accessibilityIdentifier = HW2AccessibilityIdentifiers.questionLabel
        nameTF.accessibilityIdentifier = HW2AccessibilityIdentifiers.answerTextField
        catButton.accessibilityIdentifier = HW2AccessibilityIdentifiers.optionButton1
        dogButton.accessibilityIdentifier = HW2AccessibilityIdentifiers.optionButton2
        messageLabel.accessibilityIdentifier = HW2AccessibilityIdentifiers.messageLabel
        resetButton.accessibilityIdentifier = HW2AccessibilityIdentifiers.resetButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

