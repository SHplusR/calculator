//
//  ViewController.swift
//  calculator
//
//  Created by HYORI SIM on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    
    @IBAction func touchDigit(_ sender: UIButton){
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
    
    var displayValue : Double
    {
        get{
            //displayvalue 가져오기
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func perform(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let methematicalSymbol = sender.currentTitle{
            if methematicalSymbol == "π" {
                displayValue = M_PI
            }
            else if methematicalSymbol == "√"
            {
                displayValue = sqrt(displayValue)
            }
        }
        
    }
    
    
    

}

