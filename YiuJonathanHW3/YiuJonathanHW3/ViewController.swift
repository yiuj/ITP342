//
//  ViewController.swift
//  YiuJonathanHW3
//
//  Created by Jonathan Yiu on 9/27/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var taxSegmented: UISegmentedControl!
    
    @IBOutlet weak var includeTaxSwitch: UISwitch!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var subtotalLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalWithTipLabel: UILabel!
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var clearAllButton: UIButton!
    
    var tax: Float! = 0.075
    var subtotal: Float! = 0.0
    var tipPercent: Float! = 0.15
    var tip: Float! = 0.0
    var totalWTip: Float! = 0.0
    var totalPPerson: Float! = 0.0
    var includeTax: Bool! = false;
    
    @IBAction func taxPercentChanged(_ sender: UISegmentedControl) {
        updateValues()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        includeTax = !includeTax
        updateValues()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let numberAsInt = Int(sender.value + 0.5)
        self.tipPercentLabel.text = "\(numberAsInt)%"
        tipPercent = Float(numberAsInt) * 0.01
        updateValues()
    }
    
    @IBAction func backgroundButtonExit(_ sender: UIButton) {
        self.numberTextField.resignFirstResponder()
        updateValues()
    }
    
    @IBAction func textFieldExit(_ sender: UITextField) {
        sender.resignFirstResponder()
        updateValues()
    }
    
    func updateValues() {
        var billText = numberTextField.text
        if billText!.isEmpty {
            billText = "0"
        }
        let bill = Float(billText!)
        
        //updating tax
        let index = self.taxSegmented.selectedSegmentIndex
        tax = (0.075 + (Float(index) * 0.005)) * bill!
        self.taxLabel.text = "$\(String(format: "%.2f", tax!))"
        
        //updating subtotal
        if(includeTax) {
            subtotal = bill! + tax
        }
        else {
            subtotal = bill!
        }
        self.subtotalLabel.text = "$\(String(format: "%.2f", subtotal!))"
        
        //updating tip
        tip = tipPercent * subtotal!
        self.tipLabel.text = "$\(String(format: "%.2f", tip!))"
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

