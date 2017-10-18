//
//  LoginViewController.swift
//  170927_LoginClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    var userModel = UserModel()
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signinButton: RoundButton!
    
    
    enum Gender: Int {
        case man = 1
        case female = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.layer.borderColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        userNameTextField.layer.borderWidth = 1.0
        userNameTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.borderColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 5.0
        
        userNameTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        userNameTextField.tag = 0
        passwordTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        passwordTextField.tag = 1
    }
    
    @objc func didEndOnExit (_ sender: UITextField) {
        if sender === userNameTextField {
            passwordTextField.becomeFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapSigninButton(_ sender: RoundButton) {
        guard let userName = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let  isLoginSuccess: Bool = findUser(name: userName, password: password)
        
        
        
        
        if isLoginSuccess {
            //화면 전환
            //알럿 인스턴스 생성
            let alerController = UIAlertController(title: "여기는 타이틀", message: "알럿 메세지", preferredStyle: .alert)
            //알럿 액숀인스턴스 생성
            let okAction = UIAlertAction(title: "액션입니다.", style: .default, handler: { (action) in
                print("버튼이 클릭되었습니다.")
                let main = MainViewController()
                self.present(main, animated: true, completion: nil)
            })
            let cancelAction = UIAlertAction(title: "캔슬입니다.", style: .cancel, handler: { (action) in
                print("취소버튼이 클릭되었습니다.")
                let main = MainViewController()
                self.present(main, animated: true, completion: nil)
            })
            //알럿 액숀 추가
            alerController.addAction(okAction)
            alerController.addAction(cancelAction)
            //알럿 화면 전환
            self.present(alerController, animated: true, completion: nil)
            
        }else {
            UIView.animate(withDuration: 0.1, animations: {
                
                self.userNameTextField.frame.origin.x -= 10
                self.passwordTextField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.userNameTextField.frame.origin.x += 20
                    self.passwordTextField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.userNameTextField.frame.origin.x -= 10
                        self.passwordTextField.frame.origin.x -= 10
                        self.userNameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                        self.passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                    })
                })
            })
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let nextViewController = segue.destination as? SignupViewController {
//            nextViewController.didTaskClosure = { (name: String, password: String) -> Void in
//                self.userModel.addUser(name: name, password: password)
//                
//            }
//        }
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? SignupViewController {
            nextViewController.didTaskClosure = {(name: String, password: String) -> Void in
                let ispresence = self.userModel.isPresenceUser(name: name)
                if ispresence {
                    print("등록됨")
                }else {
                    self.userModel.addUser(name: name, password: password)

                    print("가입 완료")
                }
            }
        }
    }
    
    func overlapUser (user: inout String, password: inout String) {
        
    }
    
    func findUser(name: String, password: String) -> Bool {
        //1. ID가 유효한지
        //2. password가 맞는지
        guard let userList: [[String: String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String: String]] else { return false }
        
        for userData in userList {
            let memberID = userData["ID"]
            if memberID == name {
                let memberPW = userData["PW"]
                if memberPW == password {
                    return true
                }
            }
        }
        return false
    }
    
}
