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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        if userModel.findUser(name: userName, password: password) {
            //화면 전환
            let main = MainViewController()
            self.present(main, animated: true, completion: nil)
            
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
    
}
