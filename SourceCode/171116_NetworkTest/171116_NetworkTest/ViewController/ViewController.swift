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
                let alertSheet = Alert.showAlertController(title: "로그인 성공", message: "정상적으로 로그인 되었습니다.", cancelButton: false, complition: { (action) in
                    let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
                    self.navigationController?.pushViewController(mainVC, animated: true)
                })
                
                DispatchQueue.main.async {
                    self.present(alertSheet, animated: true, completion: nil)
                }
            }else {
                let alertSheet = Alert.showAlertController(title: "실패", message: "가입 실패", cancelButton: false, complition: nil)
                
                DispatchQueue.main.async {
                    self.present(alertSheet, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as? SignUpViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    
    func checkData() -> Bool {
        return true
    }
}

