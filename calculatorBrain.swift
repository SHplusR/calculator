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
    
    var operations : Dictionary<String,Operation> =
    [
        "π" : Operation.Constant(M_PI), //Double.pi,
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos)
    ]
    enum Operation
    {
        case Constant(Double)
        case UnaryOperation((Double) ->Double)
        case BinaryOperation
        case Equals
    }
    func performOperand (symbol:String)
    {
         if let constant = operations[symbol]
        {
             if let operation = operations[symbol]
             {
                 switch operation
                 {
                     //default는 필요없다
                 case .Constant(let value) : accumulator = value
                 case .UnaryOperation(let function) : accumulator = function(accumulator)
                 case .BinaryOperation : break
                 case .Equals : break
                 }
             }
         }
       }
    var result:Double
    {
        get{
            return accumulator
        }
    }
}


