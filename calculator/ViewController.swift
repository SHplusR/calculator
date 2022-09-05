//
//  ViewController.swift
//  calculator
//
//  Created by HYORI SIM on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    
    @IBAction private func touchDigit(_ sender: UIButton){
        let digit = sender.currentTitle! //클릭한 버튼의 숫자 알기
        print("wow \(digit) touched ")
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text! //현재 라벨에 붙어있는 숫자들
            display.text = textCurrentlyInDisplay + digit //기존의 것 + 지금 누른 숫자 display에 넣기
        }
        else{
            display.text = nil
            display.text = digit //처음엔 무조건 비어지게
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue : Double
    {
        get{
            //displayvalue 가져오기
            return Double(display.text!)!
        }
        set{
            print(newValue)
            display.text = String(newValue)
        }
    }
    
    private var brian = calculatorBrain()

    
    @IBAction private func perform(_ sender: UIButton) {
        //만약 입력중이라면
        if userIsInTheMiddleOfTyping
        {
            brian.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
            
        }
        if let methematicalSymbol = sender.currentTitle{
            brian.performOperand(symbol: methematicalSymbol)
            }
        displayValue = brian.result
        
    }
}

