//
//  ViewController.swift
//  Calculator
//
//  Created by Don Goehring on 9/12/17.
//  Copyright © 2017 Goehring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userTyping: Bool = false
  
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
    set {
        display.text = String(newValue)
    }
    }
    private var brain = CalculatorBrain()
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userTyping {
            brain.setOperand(displayValue)
            userTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(mathSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
        
        
        }
    @IBOutlet var display: UILabel!
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit =  sender.currentTitle!
        if userTyping {
        let textCurrentlyInDisplay = display.text!
        display.text =  textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userTyping = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

