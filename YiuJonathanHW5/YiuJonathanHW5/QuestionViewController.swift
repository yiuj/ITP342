//
//  ViewController.swift
//  YiuJonathanHW4
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    private var flashcards: FlashcardsModel!
    
    private var isQuestion: Bool! = true
    
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
        
        flashcards = FlashcardsModel()
        self.messageLabel.text = flashcards.flashcard(atIndex: 0)?.question
    }
    
    @objc func singleTapRecognized (recognizer: UITapGestureRecognizer) {
        let firstAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: fadeOutLabel)
        firstAnimator.addCompletion { (position) in
            self.messageLabel.text = self.flashcards.randomFlashcard()?.question
            self.messageLabel.textColor = UIColor.black
            self.messageLabel.font = UIFont(name: "Zapfino", size: 30)
            let animator = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.linear, animations: {() in
                self.fadeInLabel()
            })
            animator.startAnimation()
        }
        firstAnimator.startAnimation()
        
        isQuestion = true
    }
    
    @objc func doubleTapRecognized (recognizer: UITapGestureRecognizer) {
        if isQuestion {
            let firstAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: fadeOutLabel)
            firstAnimator.addCompletion { (position) in
                self.messageLabel.text = self.flashcards.currentFlashcard()?.answer
                self.messageLabel.textColor = UIColor.blue
                self.messageLabel.font = UIFont(name: "Chalkduster", size: 30)
                let animator = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.linear, animations: {() in
                    self.fadeInLabel()
                })
                animator.startAnimation()
            }
            firstAnimator.startAnimation()
            isQuestion = false
        }
        else {
            let firstAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: fadeOutLabel)
            firstAnimator.addCompletion { (position) in
                self.messageLabel.text = self.flashcards.currentFlashcard()?.question
                self.messageLabel.textColor = UIColor.black
                self.messageLabel.font = UIFont(name: "Zapfino", size: 30)
                let animator = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.linear, animations: {() in
                    self.fadeInLabel()
                })
                animator.startAnimation()
            }
            firstAnimator.startAnimation()
            isQuestion = true
        }
    }
    
    @objc func swipeLeftRecognized (recognizer: UISwipeGestureRecognizer) {
        let firstAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: fadeOutLabel)
        firstAnimator.addCompletion { (position) in
            self.messageLabel.text = self.flashcards.nextFlashcard()?.question
            self.messageLabel.textColor = UIColor.black
            self.messageLabel.font = UIFont(name: "Zapfino", size: 30)
            let animator = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.linear, animations: {() in
                self.fadeInLabel()
            })
            animator.startAnimation()
        }
        firstAnimator.startAnimation()
        isQuestion = true
    }
    
    @objc func swipeRightRecognized (recognizer: UISwipeGestureRecognizer) {
        let firstAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: fadeOutLabel)
        firstAnimator.addCompletion { (position) in
            self.messageLabel.text = self.flashcards.previousFlashcard()?.question
            self.messageLabel.textColor = UIColor.black
            self.messageLabel.font = UIFont(name: "Zapfino", size: 30)
            let animator = UIViewPropertyAnimator(duration: 1, curve: UIViewAnimationCurve.linear, animations: {() in
                self.fadeInLabel()
            })
            animator.startAnimation()
        }
        firstAnimator.startAnimation()
        isQuestion = true
    }
    
    func fadeOutLabel() {
        messageLabel.alpha = 0
    }
    
    func fadeInLabel() {
        messageLabel.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

