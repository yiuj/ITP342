//
//  ViewController.swift
//  YiuJonathanHW3
//
//  Created by Jonathan Yiu on 9/27/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // static labels
    @IBOutlet weak var tipCalculatorLabel: UILabel!
    @IBOutlet weak var billStaticLabel: UILabel!
    @IBOutlet weak var taxStaticLabel: UILabel!
    @IBOutlet weak var includeTaxStaticLabel: UILabel!
    @IBOutlet weak var evenSplitStaticLabel: UILabel!
    @IBOutlet weak var taxAmountStaticLabel: UILabel!
    @IBOutlet weak var subtotalAmountStaticLabel: UILabel!
    @IBOutlet weak var tipAmountStaticLabel: UILabel!
    @IBOutlet weak var totalWTipStaticLabel: UILabel!
    @IBOutlet weak var totalPPersonStaticLabel: UILabel!
    // end static labels

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
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let stepperNum = Int(sender.value)
        self.splitLabel.text = "\(stepperNum)"
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
        
        //updating total with tip
        totalWTip = tax! + subtotal! + tip!
        self.totalWithTipLabel.text = "$\(String(format: "%.2f", totalWTip!))"
        
        //updating total per person
        let evenSplit = Float(splitLabel.text!)
        totalPPerson = totalWTip!/evenSplit!
        self.totalPerPersonLabel.text = "$\(String(format: "%.2f", totalPPerson!))"
    }
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
        showActionSheet()
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Clear All Values", message: "Are you sure you want to clear all values?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let clearAll = UIAlertAction(title: "Clear All", style: .default) { action in
            self.resetValues()
        }
        clearAll.setValue(UIColor.red, forKey: "titleTextColor")
        
        actionSheet.addAction(cancel)
        actionSheet.addAction(clearAll)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func resetValues() {
        numberTextField.text = ""
        taxSegmented.selectedSegmentIndex = 0
        tipSlider.setValue(15, animated: true)
        self.tipPercentLabel.text = "15%"
        splitStepper.value = 1
        splitLabel.text = "1"
        updateValues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // UI that you can interact with
        numberTextField.accessibilityIdentifier = HW3AccessibilityIdentifiers.amountTextField
        taxSegmented.accessibilityIdentifier = HW3AccessibilityIdentifiers.segmentedTax
        includeTaxSwitch.accessibilityIdentifier = HW3AccessibilityIdentifiers.includeTaxSwitch
        tipSlider.accessibilityIdentifier = HW3AccessibilityIdentifiers.tipSlider
        splitStepper.accessibilityIdentifier = HW3AccessibilityIdentifiers.splitStepper
        clearAllButton.accessibilityIdentifier = HW3AccessibilityIdentifiers.resetButton
        
        // Dynamic labels
        taxLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.taxAmountLabel
        subtotalLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.subtotalAmountLabel
        tipLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.tipAmountLabel
        totalWithTipLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.totalWithTipAmountLabel
        totalPerPersonLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.totalPerPersonLabel
        tipPercentLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.sliderLabel
        splitLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.splitLabel
        
        // Static labels
        tipCalculatorLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.tipCalculaterLabel
        billStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.billLabel
        taxStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.segmentedLabel
        includeTaxStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.includeTaxLabel
        evenSplitStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.evenSplitLabel
        taxAmountStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.taxLabel
        subtotalAmountStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.subtotalLabel
        tipAmountStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.tipLabel
        totalWTipStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.totalWithTipLabel
        totalPPersonStaticLabel.accessibilityIdentifier = HW3AccessibilityIdentifiers.totalPerPersonLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

