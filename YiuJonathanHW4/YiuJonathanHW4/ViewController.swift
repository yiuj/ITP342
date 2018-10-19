//
//  ViewController.swift
//  YiuJonathanHW4
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // SINGLE TAP
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapRecognized))
        self.view.addGestureRecognizer(singleTap)
        
        // DOUBLE TAP
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapRecognized))
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
        
        // SWIPE LEFT
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftRecognized))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        // SWIPE RIGHT
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightRecognized))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func singleTapRecognized (recognizer: UITapGestureRecognizer) {
        self.messageLabel.text = "Single Tapped!"
    }
    
    @objc func doubleTapRecognized (recognizer: UITapGestureRecognizer) {
        self.messageLabel.text = "Double Tapped!"
    }
    
    @objc func swipeLeftRecognized (recognizer: UISwipeGestureRecognizer) {
        self.messageLabel.text = "Swiped Left!"
    }
    
    @objc func swipeRightRecognized (recognizer: UISwipeGestureRecognizer) {
        self.messageLabel.text = "Swiped Right!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

