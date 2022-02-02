//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var stepperValue: Double?
    var billTotal: Double?
    var tip: Double?
    var bill: Double?

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipValue = sender.currentTitle!.prefix(2)
        tip = Double(tipValue)!
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        stepperValue = Double(sender.value)
        splitNumberLabel.text = String(describing: Int(stepperValue!))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        bill = Double(billTextField.text!)
        getPart()
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func getPart() {
        billTotal = (bill! + (bill! * (tip! * 0.01))) / stepperValue!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bill = billTotal!
            destinationVC.people = Int(stepperValue!)
            destinationVC.tip = Int(tip!)
        }
    }
}

