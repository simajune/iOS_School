//
//  ViewController.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calculatorValue: UILabel!
    
    
    var preNum: Double = 0
    var prePreNum : Double = 0
    
    var operNum: String = ""
    var preOperNum: String = ""
    var isNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //        let lb: UILabel = UILabel(frame:CGRect(x: 100, y: 50, width: 500, height: 30))
        //        lb.text = "코드로 UI만들기"
        //        self.view.addSubview(lb)
        //        let v: UIView = UIView()
        //        v.backgroundColor = .white
        //        self.view.addSubview(v)
        
        //        let cal = SubjectCalculation()
        //
        //        let math = Subject(name: "수학")
        //        math.setScore(score: 100)
        //        let english = Subject(name: "영어")
        //        english.setScore(score: 67)
        //        let science = Subject(name: "과학")
        //        science.setScore(score: 88)
        //        let coding = Subject(name: "코딩")
        //        coding.setScore(score: 100)
        //
        //        let s1 = Student(name: "정태준", id: 2008271151)
        //
        //        s1.addSubject(subject: math)
        //        s1.addSubject(subject: english)
        //        s1.addSubject(subject: science)
        //        s1.addSubject(subject: coding)
        //        print(cal.avrgCalculation(student: s1))
        
        //print(s1.totalScore)
        //calculatorValue.text = cal.avrgCalculation(student: s1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func subCalculation () {
        
    }
    
    @IBAction func numberClick (btn: UIButton) {
        if !isNumber || calculatorValue.text == "0" {
            calculatorValue.text = ""
        }
        if operNum == "" && calculatorValue.text == "0" {
            calculatorValue.text = ""
        }
        if (calculatorValue.text!.isEmpty) {
            if btn.titleLabel!.text == "." {
                calculatorValue.text = "0."
            }else {
                calculatorValue.text! = btn.titleLabel!.text!
            }
        }else {
            calculatorValue.text! += btn.titleLabel!.text!
        }
        
        if btn.titleLabel!.text == "AC" {
            calculatorValue.text = "0"
            prePreNum = 0.0
            preNum = 0.0
            preOperNum = ""
            operNum = ""
        }
        //preNum = Double(calculatorValue.text!)!
        isNumber = true
    }
    
    @IBAction func calculationBtn(btn: UIButton) {
        print(prePreNum)
        print(preNum)
        print(isNumber)
        
        if isNumber {
            if btn.titleLabel!.text == "+" {
                if operNum == "+" {
                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
                } else if operNum == "-" {
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                } else if operNum == "X" {
                    if preOperNum == "+" {
                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
                    } else if operNum == "-" {
                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
                    } else {
                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                    }
                } else if operNum == "/" {
                    if preOperNum == "+" {
                        calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                    } else if operNum == "-" {
                        calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                    } else {
                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                    }
                }
                preNum = Double(calculatorValue.text!)!
                operNum = "+"
            }else if btn.titleLabel!.text == "-" {
                if operNum == "+" {
                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
                } else if operNum == "-" {
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                } else if operNum == "X" {
                    if preOperNum == "+" {
                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
                    } else if operNum == "-" {
                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
                    } else {
                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                    }
                } else if operNum == "/" {
                    if preOperNum == "+" {
                        calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                    } else if operNum == "-" {
                        calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                    } else {
                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                    }
                }
                preNum = Double(calculatorValue.text!)!
                operNum = "-"
            }else if btn.titleLabel!.text == "X" {
                if operNum == "+" {
                    //calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperNum = "+"
                } else if operNum == "-" {
                    //calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperNum = "-"
                    
                } else if operNum == "X" {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                } else if operNum == "/" {
                    calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                }
                preNum = Double(calculatorValue.text!)!
                operNum = "X"
            }else {
                if operNum == "+" {
                    //calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperNum = "+"
                    
                } else if operNum == "-" {
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperNum = "-"
                } else if operNum == "X" {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                } else if operNum == "/" {
                    calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                }
                preNum = Double(calculatorValue.text!)!
                operNum = "/"
            }
        }
        operNum = btn.titleLabel!.text!
        isNumber = false
    }
    
    @IBAction func resultValue(_ sender: UIButton) {
        print(preNum)
        print(calculatorValue.text!)
        if isNumber {
            if operNum == "+" {
                calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
            } else if operNum == "-" {
                calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
            } else if operNum == "X" {
                if preOperNum == "+" {
                    calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
                } else if operNum == "-" {
                    calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
                } else {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                }
            } else if operNum == "/" {
                if preOperNum == "+" {
                    calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                } else if operNum == "-" {
                    calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                }else {
                    calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                }
            }
        }
        preNum = Double(calculatorValue.text!)!
        operNum = ""
        isNumber = true
        preOperNum = ""
    }
    
    @IBAction func funcClick(_ sender: UIButton) {
        if sender.titleLabel!.text == "+/-" {
            calculatorValue.text! = String(-1 * Double(calculatorValue.text!)!)
        } else {
            calculatorValue.text! = String(Double(calculatorValue.text!)! / 100)
        }
        preNum = Double(calculatorValue.text!)!
        isNumber = true
        
        
        
    }
    
    
    
}

