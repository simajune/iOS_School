//
//  UpgradeCalculatorViewController.swift
//  MyCalculator
//
//  Created by SIMA on 2017. 9. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class UpgradeCalculatorViewController: UIViewController {
    //MARK: - UI Property
    @IBOutlet var calculatorValue: UILabel!
    //MARK: - Property
    var operation: ((Double, Double) -> Double)?{
        didSet{
            displayNumber = nil
            //self.calculatorValue.text = "0"
        }
    }
    var waitingNum: Double?
    var currentNum: Double?
    
    var displayNumber: Double? {
        willSet{
            if let newValue = newValue {
            self.calculatorValue.text = String(newValue)
            }
        }
    }
    
    var inputNumber: String?
    var digit: Double = 10.0
    
    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    //MARK: - IBAction
    @IBAction func numberClick (btn: UIButton) {
        let inputNum = Double(btn.tag)
        
        if let newNum = displayNumber {
            displayNumber = (newNum * 10.0) + inputNum
        }else {
            displayNumber = inputNum
        }
    }
    
    let operatorLabel: [String] = ["+","-","*","/"]
    
    
    //사칙연산 버튼(+, -, *, /)을 눌렀을 떄
    @IBAction func calculationBtn(btn: UIButton) {
        
        if let displayNum = displayNumber {
            waitingNum = displayNum
        }
        guard let opSymbol = btn.titleLabel?.text else {return}
        
        switch opSymbol{
        case "+" :
            operation = sum
        case "-" :
            operation = sub
        case "X" :
            operation = mul
        case "/" :
            operation = div
        default :
            print("없음")
        }
    }
 
    
    
    func resultValue(num1: Double, num2: Double, oper:((Double, Double) -> Double)?) -> Double {
        var resultNumer: Double
        if let operation = oper {
            resultNumer = operation(num1, num2)
        }else {
            resultNumer = 0
        }
        return resultNumer
    }
    
    
    @IBAction func resultValue(_ sender: UIButton) {
        
        guard let currentNum = displayNumber else {return}
        
        if let waitingNum = waitingNum {
        displayNumber = resultValue(num1: waitingNum, num2: currentNum, oper: operation)
        }
    }
    //"+/-"버튼이나 "%"를 눌렀을 때
    @IBAction func funcClick(_ sender: UIButton) {
      
    }
    
    //MARK: - Method
    
    let sum = {(num1,num2) -> Double in return num1 + num2}
    let sub = {(num1,num2) -> Double in return num1 - num2}
    let mul = {(num1,num2) -> Double in return num1 * num2}
    let div = {(num1,num2) -> Double in return num1 / num2}
}
