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
    private var internalProgram =  [AnyObject]()
    func setOperand(operand : Double)
    {
        accumulator = operand
        internalProgram.append(operand)
    }
    
   private var operations : Dictionary<String,Operation> =
    [
        "π" : Operation.Constant(M_PI), //Double.pi,
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "Ⅹ" : Operation.BinaryOperation({$0 * $1}),
        "+" : Operation.BinaryOperation({$0 + $1 }),
        "-" : Operation.BinaryOperation({$0 - $1 }),
        "÷" : Operation.BinaryOperation({$0 / $1 }),
        "=" : Operation.Equals
    ]
   private enum Operation
    {
        case Constant(Double)
        case UnaryOperation((Double) ->Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    func performOperand (symbol:String)
    {
        
        internalProgram.append(contentsOf: symbol)
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
        
        private struct PendingBinaryOperationInfo
        {
            var binaryFunction : (Double, Double)->Double
            var firstOperand : Double
        }
    typealias PropertyList = AnyObject
    var program : PropertyList //anyobject이기도 하지만 propertylist이기도함을 더 명확히 보여주기 위해
    {
        get{
            return internalProgram as AnyObject
        }
        set{
             clear()
            if let arrayOfOps = newValue as? [AnyObject]
            {
                for op in arrayOfOps
                {
                    if let operand = op as? Double
                    {
                        setOperand(operand: <#T##Double#>)
                        
                    }
                    else if let operation = op as? String{
                        performOperand(symbol : <#T##String#>)
                        
                    }
                }
            }
        }
    }
    func clear(){
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
        
    }
    var result:Double
    {
        get{
            return accumulator
        }
    }
}


