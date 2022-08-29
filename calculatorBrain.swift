//
//  calculatorBrain.swift
//  calculator
//
//  Created by HYORI SIM on 2022/08/27.
//
//this is model

import Foundation

func multipy(op1 : Double, op2 : Double) -> Double
{
    return op1 * op2
}


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
        "cos" : Operation.UnaryOperation(cos),
        "Ⅹ" : Operation.BinaryOperation(multipy),
       // "+" : Operation.BinaryOperation(add),
       // "-" : Operation.BinaryOperation(minus),
       // "÷" : Operation.BinaryOperation(divide),
        "=" : Operation.Equals
    ]
    enum Operation
    {
        case Constant(Double)
        case UnaryOperation((Double) ->Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    func performOperand (symbol:String)
    {
             if let operation = operations[symbol]{
                 switch operation{
                     //default는 필요없다
                 case .Constant(let value) :
                     accumulator = value
                 case .UnaryOperation(let function) :
                     accumulator = function(accumulator)
                 case .BinaryOperation(let function) :
                     executePendingBinaryOperation()
                     pending = PendingBinaryOperationInfo(binaryFunction: function,firstOperand: accumulator)
                 case .Equals :
                     executePendingBinaryOperation()
                    
             }
         }
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil
        {
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }
    
    }
        private var pending : PendingBinaryOperationInfo?
        
        struct PendingBinaryOperationInfo
        {
            var binaryFunction : (Double, Double)->Double
            var firstOperand : Double
        }
       
    var result:Double
    {
        get{
            return accumulator
        }
    }
}


