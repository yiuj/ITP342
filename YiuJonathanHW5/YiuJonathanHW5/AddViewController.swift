//
//  AddFlashcardViewController.swift
//  YiuJonathanHW5
//
//  Created by Jonathan Yiu on 11/5/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextView.delegate = self
        answerTextField.delegate = self
        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = event!.allTouches?.first!
        if self.questionTextView.isFirstResponder && touch?.view != self.questionTextView{
            self.questionTextView.resignFirstResponder()
            self.answerTextField.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
    }
    
    
    @IBAction func textFieldExit(_ sender: UITextField) {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(self.questionTextView.text.count != 0 && self.answerTextField.text?.count != 0) {
            saveButton.isEnabled = true
        }
        else {
            saveButton.isEnabled = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(self.questionTextView.text.count != 0 && self.answerTextField.text?.count != 0) {
            saveButton.isEnabled = true
        }
        else {
            saveButton.isEnabled = false
        }
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        flashcardsData.flashcardsModel.insert(question: questionTextView.text!, answer: answerTextField.text!, favorite: false)
        print("saving...")
        flashcardsData.flashcardsModel.save()
        
        questionTextView.text = ""
        answerTextField.text = ""
        saveButton.isEnabled = false
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
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
