//
//  calculatorBrain.swift
//  calculator
//
//  Created by HYORI SIM on 2022/08/27.
//
//this is model

import Foundation

class calculatorBrain
{
    private var accumulator = 0.0
    func setOperand(operand : Double)
    {
        accumulator = operand
    }
    func performOperand (symbol:String)
    {
        switch symbol
        {
        case "π" : 	accumulator = M_PI
        case "√" : accumulator = sqrt(accumulator)
        default : break
        }
    }
    var result:Double
    {
        get{
            return accumulator
        }
    }
}


