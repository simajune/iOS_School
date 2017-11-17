//
//  ViewController.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 16..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let userName = idTextField.text else { return }
        guard let userPW = pwTextField.text else { return }
        
        NetworkManager.shared.requestLogin(userID: userName, userpw: userPW) { (isSuccess, resultData, error) in
            if isSuccess {
                print("login Success")
                //self.performSegue(withIdentifier: "MainSegue", sender: self)
                
//                let alert = UIAlertController(title: "로그인 성공", message: "정상적으로 로그인 되었습니다.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
//                    let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "Main") as! MainViewController
//                    self.navigationController?.pushViewController(mainVC, animated: true)
//                })
//                
//                alert.addAction(okAction)
//                self.present(alert, animated: true, completion: nil)
            }else {
                print("로그인 실패")
                let alertSheet = UIAlertController(title: "실패", message: "가입 실패", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertSheet.addAction(okAction)
                self.present(alertSheet, animated: true, completion: nil)
                self.navigationController?.pushViewController(alertSheet, animated: true)
            }
        }
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        
        
    }
    func checkData() -> Bool {
        return true
    }
}

