//
//  SignupViewController.swift
//  170927_LoginClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit



class SignupViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repasswordTextField: UITextField!
    
    var didTaskClosure: ((String, String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        usernameTextField.tag = 0
        usernameTextField.layer.borderColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.cornerRadius = 5.0
        
        passwordTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        passwordTextField.tag = 1
        passwordTextField.layer.borderColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 5.0
        
        repasswordTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        repasswordTextField.tag = 1
        repasswordTextField.layer.borderColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        repasswordTextField.layer.borderWidth = 1.0
        repasswordTextField.layer.cornerRadius = 5.0
    }

    @objc func didEndOnExit (_ sender: UITextField) {
//        let textFieldName = sender.tag
//        if textFieldName == 0 {
//            passwordTextField.becomeFirstResponder()
//        }else if textFieldName == 1{
//            repasswordTextField.becomeFirstResponder()
//        }
        if sender === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if sender === passwordTextField {
            repasswordTextField.becomeFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapExitButton(_ sender: UIButton) {

        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didCreateAccount(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let repassword = repasswordTextField.text else { return }
        
        //입력 받은 패스워드가 같은지
        if password == repassword {
            var list: [[String: String]]
            //값을 받아온다. 그래서 값이 있으면 배열을 그대로 받아오고 없으면 초기화
            if let tmpList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
                list = tmpList
            }else {
                list = []
            }
            
            let userData: [String:String] = ["ID": username, "PW": password]
            list.append(userData)
            
            
            UserDefaults.standard.set(list, forKey: "UserList")
            
            //didTaskClosure?(username,password)
            
//            UserDefaults.standard.set(username, forKey: "ID")
//            UserDefaults.standard.set(password, forKey: "PW")
            
            dismiss(animated: true, completion: nil)
            //print()
        } else {
            print ("fail")
        }
        
    }

}
