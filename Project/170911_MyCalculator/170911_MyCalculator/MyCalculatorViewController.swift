//
//  MyCalculatorViewController.swift
//  MyCalculator
//
//  Created by SIMA on 2017. 9. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MyCalculatorViewController: UIViewController {
    //MARK: - UI Property
    @IBOutlet var calculatorValue: UILabel!
    
    //MARK: - Property
    var displayLb: Double? = 0 {
        willSet{
            if let newValue = newValue {
                print(newValue)
                self.calculatorValue.text = String(newValue)
            }
        }
    }
    
    var prevNumLb: Double?
    var operation: ((Double, Double) -> Double)? {
        didSet{
            prevNumLb = displayLb
            displayLb = nil
        }
    }

    //MARK: - App Lafe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //MARK: - IBAction
    @IBAction func numberClick (btn: UIButton) {            //버튼(0 ~ 9, AC)을 클릭할 때
        let pressNum = Double(btn.tag)
        
        if let currentNum = displayLb {
            displayLb = currentNum * 10 + pressNum
        }else {
            displayLb = pressNum
        }
    }
    
    //사칙연산 버튼(+, -, *, /)을 눌렀을 떄
    @IBAction func calculationBtn(btn: UIButton) {
//        if let displayLb = displayLb {
//            prevNumLb = displayLb
//        }
        
        if let operTitle = btn.titleLabel?.text{
            switch operTitle {
            case "+" :
                operation = sum
            case "-" :
                operation = sub
            case "*" :
                operation = mul
            case "/" :
                operation = div
            default :
                print("&&")
            }
        }
    }

    func resultNum(num1: Double, num2: Double, oper: ((Double, Double) -> Double)?) -> Double {
        var resultNumber: Double = 0
        if let operation = oper {
            print(num1)
            print(num2)
            resultNumber = operation(num1, num2)
        }
        return resultNumber
    }
    
    
    @IBAction func resultValue(_ sender: UIButton) {                    //"="버튼을 눌렀을 때
        let currentNum = displayLb
        if let prevNumLb = prevNumLb, let currentNum = currentNum {
            print(prevNumLb)
            displayLb = resultNum(num1: prevNumLb, num2: currentNum, oper: operation)
        }

//        if let prevNumLb = prevNumLb, var displayLb = displayLb {
//            //print(prevNumLb)
//            displayLb = resultNum(num1: prevNumLb, num2: displayLb, oper: operation)
//            print(displayLb)
//        }
    }
    //"+/-"버튼이나 "%"를 눌렀을 때
    @IBAction func funcClick(_ sender: UIButton) {

    }
    
    ////
    let sum = {(num1, num2) -> Double in return num1 + num2}
    let sub = {(num1, num2) -> Double in return num1 - num2}
    let mul = {(num1, num2) -> Double in return num1 * num2}
    let div = {(num1, num2) -> Double in return num1 / num2}
}
