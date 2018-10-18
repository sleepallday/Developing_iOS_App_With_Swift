//
//  ViewController.swift
//  calculator
//
//  Created by Li, Bo on 2018/9/6.
//  Copyright © 2018 Li, Bo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
        
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping{
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let methematicalSymbol = sender.currentTitle {
            brain.performOperation(methematicalSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
    }
}

