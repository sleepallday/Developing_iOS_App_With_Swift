//
//  CalculatorBrain.swift
//  calculator
//
//  Created by 李煜玮 on 2018/10/14.
//  Copyright © 2018年 Li, Bo. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private var accumulator: Double?
    var result: Double? {
        get{
            return accumulator
        }
    }
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt)
    ]
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
                case .unaryOperation(<#T##(Double) -> Double#>)
            }
        }
    }
}
