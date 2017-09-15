//
//  ViewController.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calculatorValue: UILabel!
    
    var preNum: Double = 0          //전에 받은 값
    var prePreNum : Double = 0      //전 전에 받은 값 -> 만약 계산이 1 + 1 x 3 = 4 같은 경우 사용 계산 순서가 들어갈 경우 사용
    
    var Operator: String = ""        //현재 받은 사칙연산 값
    var preOperator: String = ""     //전에 받은 사칙연산 값 -> 계산 순서가 필요한 경우 첫번째 저장할 사칙연산을 대입
    var isNumber: Bool = true       //숫자를 계속 받아도 되는지 확인하는 변수
    var isPoint: Bool = true        //지금 현재 text에 포인트(.)이 있는지 확인하는 변수
    var isInteger: Bool = true      //현재의 text의 결과 값이 int인지 확인하는 변수
    var isWrong: Bool = false       //나누기 0을 했는지 안했는지 확인하는 변수
    
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
    
    @IBAction func numberClick (btn: UIButton) {            //버튼(0 ~ 9, AC)을 클릭할 때
        
        
        //초기화 조건
        if !isNumber || calculatorValue.text == "0" {       //만약 현재 텍스트가 0이거나 숫자를 받아야 하지 말아야 할 때
            calculatorValue.text = ""
        }
        if Operator == "" && calculatorValue.text == "0" {   //만약 이전에 사칙연산을 누른적이 없고 텍스트가 0인 경우
            calculatorValue.text = ""
        }
        if Operator == "" && calculatorValue.text == "숫자 아님" {   //나누기 0을 하고 "="을 누르고 다시 숫자 버튼을 누른 경우
            calculatorValue.text = ""
        }
        
        if (calculatorValue.text!.isEmpty) {                 //텍스트가 비어 있다면
            if btn.titleLabel!.text == "." {                 //그리고 "."을 눌렀을 때는
                calculatorValue.text = "0."                 //텍스트에 0.을 출력해준다.
            }else {
                calculatorValue.text! = btn.titleLabel!.text!   //"."이 아닌 경우에는 그냥 숫자 입력
            }
        }else {                                             //텍스트가 비어 있지 않다면
            if !calculatorValue.text!.contains(".") {       //그리고 텍스트에 "."이 있지 않다면
                calculatorValue.text! += btn.titleLabel!.text!  //버튼을 그냥 출력하고
            }else {                                         //만약 텍스트에 "."이 있고 버튼을 "."이 안눌렀을 때는 출력하고 "."들어갈 때는 입력 불가
                if (btn.titleLabel!.text!) != "." {
                    calculatorValue.text! += btn.titleLabel!.text!
                }
            }
        }
        
        if btn.titleLabel!.text == "AC" {       //AC 버튼을 눌렀을 떄 text값 이전에 받은 값과 사칙연산 값을 다 초기화
            calculatorValue.text = "0"
            prePreNum = 0.0
            preNum = 0.0
            preOperator = ""
            Operator = ""
        }
        isNumber = true
    }
    
//사칙연산 버튼(+, -, *, /)을 눌렀을 떄
    @IBAction func calculationBtn(btn: UIButton) {
        if isNumber {
            switch btn.titleLabel!.text! {
            case "+" :
                if Operator == "+" {                    //이전에 사칙연산 버튼을 누른적이 있는지 그것이 "+"였는지 확인
                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)  //이전 값이 있다면 이전 값에 입력한 값을 더해준다.
                } else if Operator == "-" {             //이전에 사칙연산 버튼을 누른적이 있는지 그것이 "-"였는지 확인
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)  ////이전 값이 있다면 이전 값에 입력한 값을 뺴준다.
                } else if Operator == "X" {             //"*"을 누를 경우에는 예외처리
                    if preOperator == "+" {             //만약 "*" 누르기 전에 사칙연산이 +버튼이라면
                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)  //계산 순서를 변경해서 계산
                    } else if Operator == "-" {         //만약 "*" 누르기 전에 사칙연산이 -버튼이라면
                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)  //계산 순서를 변경해서 계산
                    } else {                            //그 외에는 계산 순서가 상관이 없으므로 그냥 계산
                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                    }
                } else if Operator == "/" {             //"/"버튼도 이전의 연산이 어떤 것이냐에 따라 순서가 바뀌므로 예외처리
                    if calculatorValue.text! == "0" {
                        isWrong = true
                    } else {
                        if preOperator == "+" {
                            calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                        } else if Operator == "-" {
                            calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                        } else {
                            calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                        }
                    }
                }
                preNum = Double(calculatorValue.text!)! //계산 후에는 그 값을 전 preNum에 넣어서 보관해서 다음 연산에 적용
                Operator = "+"
            case "-" :
                if Operator == "+" {
                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
                } else if Operator == "-" {
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                } else if Operator == "X" {
                    if preOperator == "+" {
                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
                    } else if Operator == "-" {
                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
                    } else {
                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                    }
                } else if Operator == "/" {
                    if calculatorValue.text! == "0" {
                        isWrong = true
                    } else {
                        if preOperator == "+" {
                            calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                        } else if Operator == "-" {
                            calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                        } else {
                            calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                        }
                    }
                }
                preNum = Double(calculatorValue.text!)!
                Operator = "-"
            case "X" :
                if Operator == "+" {                //이전의 연산값이 "+"버튼이면 연산을 저장하고 있다가 다음 숫자를 누르고 다음 연산버튼이 눌렸을 때 순서를 고려해야 하면 순서를 고려해서 계산하게 한다.
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperator = "+"
                } else if Operator == "-" {
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperator = "-"
                } else if Operator == "X" {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                } else if Operator == "/" {
                    if calculatorValue.text! == "0" {
                        isWrong = true
                    } else {
                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                    }
                }
                preNum = Double(calculatorValue.text!)!
                Operator = "X"
            case "/" :
                if Operator == "+" {
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperator = "+"
                    
                } else if Operator == "-" {
                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
                    prePreNum = preNum
                    preNum = Double(calculatorValue.text!)!
                    preOperator = "-"
                } else if Operator == "X" {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                } else if Operator == "/" {
                    if calculatorValue.text! == "0" {                       //나누기 0일 때는 isWrong을 true로 변환
                        isWrong = true
                    } else {
                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                    }
                }
                preNum = Double(calculatorValue.text!)!
                Operator = "/"
            default :
                print("이거 출려되면 디버그 해야함")
            
            }
        }
        
            
            
////            if btn.titleLabel!.text == "+" {            //만약 버튼 누른 값이 "+"버튼 이라면
////                if Operator == "+" {                    //이전에 사칙연산 버튼을 누른적이 있는지 그것이 "+"였는지 확인
////                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)  //이전 값이 있다면 이전 값에 입력한 값을 더해준다.
////                } else if Operator == "-" {             //이전에 사칙연산 버튼을 누른적이 있는지 그것이 "-"였는지 확인
////                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)  ////이전 값이 있다면 이전 값에 입력한 값을 뺴준다.
////                } else if Operator == "X" {             //"*"을 누를 경우에는 예외처리
////                    if preOperator == "+" {             //만약 "*" 누르기 전에 사칙연산이 +버튼이라면
////                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)  //계산 순서를 변경해서 계산
////                    } else if Operator == "-" {         //만약 "*" 누르기 전에 사칙연산이 -버튼이라면
////                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)  //계산 순서를 변경해서 계산
////                    } else {                            //그 외에는 계산 순서가 상관이 없으므로 그냥 계산
////                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
////                    }
////                } else if Operator == "/" {             //"/"버튼도 이전의 연산이 어떤 것이냐에 따라 순서가 바뀌므로 예외처리
////                    if calculatorValue.text! == "0" {
////                        isWrong = true
////                    } else {
////                        if preOperator == "+" {
////                            calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
////                        } else if Operator == "-" {
////                            calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
////                        } else {
////                            calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
////                        }
////                    }
////                }
////                preNum = Double(calculatorValue.text!)! //계산 후에는 그 값을 전 preNum에 넣어서 보관해서 다음 연산에 적용
////                Operator = "+"
////                
////                
////                
////                
////            }else if btn.titleLabel!.text == "-" {      //"+"버튼과 마찬가지다. 예외처리 해주는 부분은 동일
////                if Operator == "+" {
////                    calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
////                } else if Operator == "-" {
////                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
////                } else if Operator == "X" {
////                    if preOperator == "+" {
////                        calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
////                    } else if Operator == "-" {
////                        calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
////                    } else {
////                        calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
////                    }
////                } else if Operator == "/" {
////                    if calculatorValue.text! == "0" {
////                        isWrong = true
////                    } else {
////                        if preOperator == "+" {
////                            calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
////                        } else if Operator == "-" {
////                            calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
////                        } else {
////                            calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
////                        }
////                    }
////                }
////                preNum = Double(calculatorValue.text!)!
////                Operator = "-"
////                
////                
//            }else if btn.titleLabel!.text == "X" {  //곱셈을 눌렀을 때는 이전의 연산 값이 어떤 것인지에 따라 바로 계산을 할지 값을 저장하고 있다가 계산할지 정해야 한다.
//                if Operator == "+" {                //이전의 연산값이 "+"버튼이면 연산을 저장하고 있다가 다음 숫자를 누르고 다음 연산버튼이 눌렸을 때 순서를 고려해야 하면 순서를 고려해서 계산하게 한다.
//                    prePreNum = preNum
//                    preNum = Double(calculatorValue.text!)!
//                    preOperator = "+"
//                } else if Operator == "-" {
//                    prePreNum = preNum
//                    preNum = Double(calculatorValue.text!)!
//                    preOperator = "-"
//                } else if Operator == "X" {
//                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
//                } else if Operator == "/" {
//                    if calculatorValue.text! == "0" {
//                        isWrong = true
//                    } else {
//                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
//                    }
//                }
//                preNum = Double(calculatorValue.text!)!
//                Operator = "X"
//            }else {                                 //나누기도 곱하기와 마찬가지로 예외처리를 동일하게 처리
//                if Operator == "+" {
//                    prePreNum = preNum
//                    preNum = Double(calculatorValue.text!)!
//                    preOperator = "+"
//                    
//                } else if Operator == "-" {
//                    calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
//                    prePreNum = preNum
//                    preNum = Double(calculatorValue.text!)!
//                    preOperator = "-"
//                } else if Operator == "X" {
//                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
//                } else if Operator == "/" {
//                    if calculatorValue.text! == "0" {                       //나누기 0일 때는 isWrong을 true로 변환
//                        isWrong = true
//                    } else {
//                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
//                    }
//                }
//                preNum = Double(calculatorValue.text!)!
//                Operator = "/"
//            }
//        }
//        
//        
        
        
        isInteger = floor(Double(calculatorValue.text!)!) == Double(calculatorValue.text!)!     //만약 계산 후의 값이 Double인지 Int인지 판별
        
        if isInteger {                                                                          //만약 Int값이면 Double 값을 Int값으로 출력
            calculatorValue.text = String(Int(Double(calculatorValue.text!)!))
        }
        
        if isWrong{                                                         //나누기 0이 들어왔을 떄는 텍스트에 "숫자 없음"을 출력
            calculatorValue.text = "숫자 아님"
            isWrong = false
        }
        
        Operator = btn.titleLabel!.text!
        isNumber = false
    }
    
    
    
    @IBAction func resultValue(_ sender: UIButton) {                    //"="버튼을 눌렀을 때
        if isNumber {                                                   //숫자가 입력이 되어도 되는 상황이라면 값을 계산하고 그렇지 않을 경우에는 어떠한 값도 입력시키지 않는다
            if Operator == "+" {
                calculatorValue.text = String(preNum + Double(calculatorValue.text!)!)
            } else if Operator == "-" {
                calculatorValue.text = String(preNum - Double(calculatorValue.text!)!)
            } else if Operator == "X" {                                 //계산 순서가 필요한 예외처리
                if preOperator == "+" {
                    calculatorValue.text = String(prePreNum + preNum * Double(calculatorValue.text!)!)
                } else if Operator == "-" {
                    calculatorValue.text = String(prePreNum - preNum * Double(calculatorValue.text!)!)
                } else {
                    calculatorValue.text = String(preNum * Double(calculatorValue.text!)!)
                }
            } else if Operator == "/" {                                 //계산 순서가 필요한 예외처리
                if calculatorValue.text! == "0" || calculatorValue.text! == "0."{
                    isWrong = true
                }else {
                    if preOperator == "+" {
                        calculatorValue.text = String(prePreNum + preNum / Double(calculatorValue.text!)!)
                    } else if Operator == "-" {
                        calculatorValue.text = String(prePreNum - preNum / Double(calculatorValue.text!)!)
                    }else {
                        calculatorValue.text = String(preNum / Double(calculatorValue.text!)!)
                    }
                }
            }
        }
        isInteger = floor(Double(calculatorValue.text!)!) == Double(calculatorValue.text!)!
        
        if isInteger {
            calculatorValue.text = String(Int(Double(calculatorValue.text!)!))
        }
        preNum = Double(calculatorValue.text!)!
        if isWrong{
            calculatorValue.text = "숫자 아님"
            isWrong = false
        }
        
        Operator = ""
        isNumber = true
        preOperator = ""
    }
//"+/-"버튼이나 "%"를 눌렀을 때
    @IBAction func funcClick(_ sender: UIButton) {
        if sender.titleLabel!.text == "+/-" {
            isInteger = floor(Double(calculatorValue.text!)!) == Double(calculatorValue.text!)!
            if isInteger {
                calculatorValue.text = String(Int(-1 * Double(calculatorValue.text!)!))
            }
        } else {
            calculatorValue.text! = String(Double(calculatorValue.text!)! / 100)
        }
        preNum = Double(calculatorValue.text!)!
        isNumber = true
    }
}



