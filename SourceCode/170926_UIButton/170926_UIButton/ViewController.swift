//
//  ViewController.swift
//  170926_UIButton
//
//  Created by SIMA on 2017. 9. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var onBtn: UIButton!
    var offBtn: UIButton!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    var btn5: UIButton!
    var btn6: UIButton!
    var btn7: UIButton!
    var btn8: UIButton!
    var btn9: UIButton!
    var textLB: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        btn.titleLabel?.text = "버튼"
        btn.setTitle("버튼", for: .normal)
        btn.backgroundColor = .red
//        btn.setBackgroundImage(UIImage(named:"bg1.png"), for: UIControlState.normal)
        btn.setTitleColor(.green, for: .normal)
        btn.addTarget(self,
                      action:#selector(ViewController.btnAction(sender:)),
                      for: .touchUpInside)
        self.view.addSubview(btn)
        
        //연습문제
//        onBtn = UIButton(type: .custom)
//        onBtn.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
//        view.addSubview(onBtn)
//        onBtn.backgroundColor = .red
//        onBtn.setTitle("ON", for: .normal)
//        onBtn.setTitleColor(.black, for: .normal)
//        onBtn.setTitleColor(.green, for: .selected)
//        onBtn.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)
//
//
//        offBtn = UIButton(type: .custom)
//        offBtn.frame = CGRect(x: 10, y: 200, width: 100, height: 100)
//        view.addSubview(offBtn)
//        offBtn.backgroundColor = .red
//        offBtn.setTitle("OFF", for: .normal)
//        offBtn.setTitleColor(.black, for: .normal)
//        offBtn.setTitleColor(.green, for: .selected)
//        offBtn.addTarget(self, action: #selector(offBtnClicked(_:)), for: .touchUpInside)
//        offBtn.isSelected = true
//        offBtn.isUserInteractionEnabled = false
        
        //EX 1>
        
//        //1번 버튼
//        btn1 = UIButton(type: .custom)
//        btn1.frame = CGRect(x: 0, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn1)
//        btn1.backgroundColor = .blue
//        btn1.layer.borderColor = UIColor.black.cgColor
//        btn1.layer.borderWidth = 1.0
//        btn1.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //2번 버튼
//        btn2 = UIButton(type: .custom)
//        btn2.frame = CGRect(x: btn1.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn2)
//        btn2.backgroundColor = .blue
//        btn2.layer.borderColor = UIColor.black.cgColor
//        btn2.layer.borderWidth = 1.0
//        btn2.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//
//        //3번 버튼
//        btn3 = UIButton(type: .custom)
//        btn3.frame = CGRect(x: btn2.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn3)
//        btn3.backgroundColor = .blue
//        btn3.layer.borderColor = UIColor.black.cgColor
//        btn3.layer.borderWidth = 1.0
//        btn3.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//
//        //4번 버튼
//        btn4 = UIButton(type: .custom)
//        btn4.frame = CGRect(x: 0, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn4)
//        btn4.backgroundColor = .blue
//        btn4.layer.borderColor = UIColor.black.cgColor
//        btn4.layer.borderWidth = 1.0
//        btn4.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //5번 버튼
//        btn5 = UIButton(type: .custom)
//        btn5.frame = CGRect(x: btn1.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn5)
//        btn5.backgroundColor = .blue
//        btn5.layer.borderColor = UIColor.black.cgColor
//        btn5.layer.borderWidth = 1.0
//        btn5.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //6번 버튼
//        btn6 = UIButton(type: .custom)
//        btn6.frame = CGRect(x: btn2.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn6)
//        btn6.backgroundColor = .blue
//        btn6.layer.borderColor = UIColor.black.cgColor
//        btn6.layer.borderWidth = 1.0
//        btn6.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //7번 버튼
//        btn7 = UIButton(type: .custom)
//        btn7.frame = CGRect(x: 0, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn7)
//        btn7.backgroundColor = .blue
//        btn7.layer.borderColor = UIColor.black.cgColor
//        btn7.layer.borderWidth = 1.0
//        btn7.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //8번 버튼
//        btn8 = UIButton(type: .custom)
//        btn8.frame = CGRect(x: btn1.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn8)
//        btn8.backgroundColor = .blue
//        btn8.layer.borderColor = UIColor.black.cgColor
//        btn8.layer.borderWidth = 1.0
//        btn8.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        
//        //9번 버튼
//        btn9 = UIButton(type: .custom)
//        btn9.frame = CGRect(x: btn2.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn9)
//        btn9.backgroundColor = .blue
//        btn9.layer.borderColor = UIColor.black.cgColor
//        btn9.layer.borderWidth = 1.0
//        btn9.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        
        
        //EX 2>
//        
//        //1번 버튼
//        btn1 = UIButton(type: .custom)
//        btn1.frame = CGRect(x: 0, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn1)
//        btn1.backgroundColor = .blue
//        btn1.layer.borderColor = UIColor.black.cgColor
//        btn1.layer.borderWidth = 1.0
//        btn1.addTarget(self, action: #selector(oddBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //2번 버튼
//        btn2 = UIButton(type: .custom)
//        btn2.frame = CGRect(x: btn1.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn2)
//        btn2.backgroundColor = .blue
//        btn2.layer.borderColor = UIColor.black.cgColor
//        btn2.layer.borderWidth = 1.0
//        btn2.addTarget(self, action: #selector(evenBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //3번 버튼
//        btn3 = UIButton(type: .custom)
//        btn3.frame = CGRect(x: btn2.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn3)
//        btn3.backgroundColor = .blue
//        btn3.layer.borderColor = UIColor.black.cgColor
//        btn3.layer.borderWidth = 1.0
//        btn3.addTarget(self, action: #selector(oddBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //4번 버튼
//        btn4 = UIButton(type: .custom)
//        btn4.frame = CGRect(x: 0, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn4)
//        btn4.backgroundColor = .blue
//        btn4.layer.borderColor = UIColor.black.cgColor
//        btn4.layer.borderWidth = 1.0
//        btn4.addTarget(self, action: #selector(evenBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //5번 버튼
//        btn5 = UIButton(type: .custom)
//        btn5.frame = CGRect(x: btn1.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn5)
//        btn5.backgroundColor = .blue
//        btn5.layer.borderColor = UIColor.black.cgColor
//        btn5.layer.borderWidth = 1.0
//        btn5.addTarget(self, action: #selector(oddBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //6번 버튼
//        btn6 = UIButton(type: .custom)
//        btn6.frame = CGRect(x: btn2.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn6)
//        btn6.backgroundColor = .blue
//        btn6.layer.borderColor = UIColor.black.cgColor
//        btn6.layer.borderWidth = 1.0
//        btn6.addTarget(self, action: #selector(evenBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //7번 버튼
//        btn7 = UIButton(type: .custom)
//        btn7.frame = CGRect(x: 0, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn7)
//        btn7.backgroundColor = .blue
//        btn7.layer.borderColor = UIColor.black.cgColor
//        btn7.layer.borderWidth = 1.0
//        btn7.addTarget(self, action: #selector(oddBtnClicked(_:)), for: .touchUpInside)
//        
//        
//        //8번 버튼
//        btn8 = UIButton(type: .custom)
//        btn8.frame = CGRect(x: btn1.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn8)
//        btn8.backgroundColor = .blue
//        btn8.layer.borderColor = UIColor.black.cgColor
//        btn8.layer.borderWidth = 1.0
//        btn8.addTarget(self, action: #selector(evenBtnClicked(_:)), for: .touchUpInside)
//
//        
//        //9번 버튼
//        btn9 = UIButton(type: .custom)
//        btn9.frame = CGRect(x: btn2.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
//        view.addSubview(btn9)
//        btn9.backgroundColor = .blue
//        btn9.layer.borderColor = UIColor.black.cgColor
//        btn9.layer.borderWidth = 1.0
//        btn9.addTarget(self, action: #selector(oddBtnClicked(_:)), for: .touchUpInside)
/*
        //EX 3>
        
        //1번 버튼
        btn1 = UIButton(type: .custom)
        btn1.frame = CGRect(x: 0, y: 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn1)
        btn1.backgroundColor = .blue
        btn1.setTitle("1번", for: .normal)
        btn1.layer.borderColor = UIColor.black.cgColor
        btn1.layer.borderWidth = 1.0
        btn1.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn1.titleLabel?.text = "1번 눌림"


        //2번 버튼
        btn2 = UIButton(type: .custom)
        btn2.frame = CGRect(x: btn1.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn2)
        btn2.backgroundColor = .blue
        btn2.setTitle("2번", for: .normal)
        btn2.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderWidth = 1.0
        btn2.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn2.titleLabel?.text = "2번 눌림"


        //3번 버튼
        btn3 = UIButton(type: .custom)
        btn3.frame = CGRect(x: btn2.frame.maxX, y: 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn3)
        btn3.backgroundColor = .blue
        btn3.setTitle("3번", for: .normal)
        btn3.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderWidth = 1.0
        btn3.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn3.titleLabel?.text = "3번 눌림"


        //4번 버튼
        btn4 = UIButton(type: .custom)
        btn4.frame = CGRect(x: 0, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn4)
        btn4.backgroundColor = .blue
        btn4.setTitle("4번", for: .normal)
        btn4.layer.borderColor = UIColor.black.cgColor
        btn4.layer.borderWidth = 1.0
        btn4.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn4.titleLabel?.text = "4번 눌림"


        //5번 버튼
        btn5 = UIButton(type: .custom)
        btn5.frame = CGRect(x: btn1.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn5)
        btn5.backgroundColor = .blue
        btn5.setTitle("5번", for: .normal)
        btn5.layer.borderColor = UIColor.black.cgColor
        btn5.layer.borderWidth = 1.0
        btn5.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn5.titleLabel?.text = "5번 눌림"


        //6번 버튼
        btn6 = UIButton(type: .custom)
        btn6.frame = CGRect(x: btn2.frame.maxX, y: view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn6)
        btn6.backgroundColor = .blue
        btn6.setTitle("6번", for: .normal)
        btn6.layer.borderColor = UIColor.black.cgColor
        btn6.layer.borderWidth = 1.0
        btn6.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn6.titleLabel?.text = "6번 눌림"


        //7번 버튼
        btn7 = UIButton(type: .custom)
        btn7.frame = CGRect(x: 0, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn7)
        btn7.backgroundColor = .blue
        btn7.setTitle("7번", for: .normal)
        btn7.layer.borderColor = UIColor.black.cgColor
        btn7.layer.borderWidth = 1.0
        btn7.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn7.titleLabel?.text = "7번 눌림"


        //8번 버튼
        btn8 = UIButton(type: .custom)
        btn8.frame = CGRect(x: btn1.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn8)
        btn8.backgroundColor = .blue
        btn8.setTitle("8번", for: .normal)
        btn8.layer.borderColor = UIColor.black.cgColor
        btn8.layer.borderWidth = 1.0
        btn8.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn8.titleLabel?.text = "8번 눌림"

        
        //9번 버튼
        btn9 = UIButton(type: .custom)
        btn9.frame = CGRect(x: btn2.frame.maxX, y: 2*view.frame.width/3 + 20, width: view.frame.width/3, height: view.frame.width/3)
        view.addSubview(btn9)
        btn9.backgroundColor = .blue
        btn9.setTitle("9번", for: .normal)
        btn9.layer.borderColor = UIColor.black.cgColor
        btn9.layer.borderWidth = 1.0
        btn9.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        btn9.titleLabel?.text = "9번 눌림"
       */
        
        //textLabel
//        textLB = UILabel(frame: CGRect(x: 0, y: 500, width: view.frame.width, height: 50))
//        view.addSubview(textLB)
//        textLB.backgroundColor = .green
//        textLB.textAlignment = .center
//
//
//        for i in 0 ..< 9 {
//            var tmpButton: UIButton
//            var yNumber: Int
//            tmpButton = UIButton()
//            if i < 3 {
//                yNumber = 20
//                tmpButton.frame = CGRect(x: 375 / 3 * i, y: yNumber, width: 375 / 3, height: 375 / 3)
//            }else if i < 6 {
//                yNumber = 375 / 3 + 20
//                tmpButton.frame = CGRect(x: 375 / 3 * (i - 3), y: yNumber, width: 375 / 3, height: 375 / 3)
//            }else {
//                yNumber = 2 * 375 / 3 + 20
//                tmpButton.frame = CGRect(x: 375 / 3 * (i - 6), y: yNumber, width: 375 / 3, height: 375 / 3)
//            }
//            tmpButton.backgroundColor = .blue
//            tmpButton.setTitle("\(i + 1)번", for: .normal)
//            tmpButton.layer.borderColor = UIColor.black.cgColor
//            tmpButton.layer.borderWidth = 1.0
//            tmpButton.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//            view.addSubview(tmpButton)
//        }
        

    }
    
    func btnAction(sender:UIButton) {
        //버튼 이벤트시 액션
    }
    
    //EX 1>
    
    func btnClicked (_ sender: UIButton) {
        if sender.isSelected {
            sender.backgroundColor = .blue
            sender.isSelected = false
        }else {
            sender.backgroundColor = .gray
            sender.isSelected = true
        }
    }
    
    //EX 2>
//    func oddBtnClicked(_ sender: UIButton) {
//        let oddArr: [UIButton] = [btn1, btn3, btn5, btn7, btn9]
//        if sender.isSelected {
//            for indexArr in oddArr {
//                indexArr.isSelected = false
//                indexArr.backgroundColor = .blue
//            }
//        }else {
//            for indexArr in oddArr {
//                indexArr.isSelected = true
//                indexArr.backgroundColor = .gray
//            }
//        }
//    }
//
//    func evenBtnClicked(_ sender: UIButton) {
//        let evenArr: [UIButton] = [btn2, btn4, btn6, btn8]
//        if sender.isSelected {
//            for indexArr in evenArr {
//                indexArr.isSelected = false
//                indexArr.backgroundColor = .blue
//            }
//        }else {
//            for indexArr in evenArr {
//                indexArr.isSelected = true
//                indexArr.backgroundColor = .gray
//            }
//        }
//    }
    
    
    //EX 3>
    
//    func btnClicked (_ sender: UIButton) {
//        textLB.text = sender.titleLabel?.text
//    }

    
    
    
    
    
    
    
    
    //연습문제
    func onBtnClicked (_ sender: UIButton) {
        onBtn.isSelected = true
        onBtn.isUserInteractionEnabled = false
        offBtn.isSelected = false
        offBtn.isUserInteractionEnabled = true
    }
    
    func offBtnClicked (_ sender: UIButton) {
        offBtn.isSelected = true
        offBtn.isUserInteractionEnabled = false
        onBtn.isSelected = false
        onBtn.isUserInteractionEnabled = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

