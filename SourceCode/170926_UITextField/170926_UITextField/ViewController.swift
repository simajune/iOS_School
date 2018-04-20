//
//  ViewController.swift
//  170926_UITextField
//
//  Created by SIMA on 2017. 9. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var nameText: UITextField!
    var confirmBtn: UIButton!
    var nameLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //키보드 내리기
        //resignFirstResponder()
        
        
        nameText = UITextField(frame: CGRect(x: 20, y: 50, width: 250, height: 50))
        view.addSubview(nameText)
        nameText.borderStyle = .line
        nameText.textAlignment = .right
        nameText.backgroundColor = .green
        nameText.placeholder = "여기에 입력하세요"
        //델리게이트 사용//
        nameText.delegate = self

//        confirmBtn = UIButton(type: .contactAdd)
//        confirmBtn.frame = CGRect(x: 280, y: 50, width: 50, height: 50)
//        view.addSubview(confirmBtn)
//        confirmBtn.addTarget(self, action: #selector(self.btnClicked(_:)), for: .touchUpInside)
//        
//        nameLb = UILabel(frame: CGRect(x: 20, y: 120, width: 250, height: 50))
//        view.addSubview(nameLb)

    }
    //델리게이트 함수//
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return true
    }
    
    
    
    func btnClicked (_ sender: UIButton) {
        nameLb.text = nameText.text
        nameText.text = ""
        //sender.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

