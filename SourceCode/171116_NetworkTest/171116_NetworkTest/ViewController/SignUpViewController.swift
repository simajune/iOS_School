//
//  SignUpViewController.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 16..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var repwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func signupConfimButton(_ sender: UIButton) {
        guard let userID = idTextField.text else { return }
        guard let userPW = pwTextField.text else { return }
        guard let userRePW = repwTextField.text else { return }
        
        NetworkManager.shared.requestSignup(userid: userID, pw: userPW, repw: userRePW, completion: { (isSuccess, resultData, error) in
            if isSuccess {
                print("signup Success")                
                let alerSheet = Alert.showAlertController(title: "가입성공", message: "정상적으로\n가입이 완료되었습니다.", cancelButton: false, complition: { (action) in
                    if let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController {
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                })
                DispatchQueue.main.async {
                    self.present(alerSheet, animated: true, completion: nil)
                }
            }else {
                let alertSheet = Alert.showAlertController(title: "실패", message: "가입실패", cancelButton: false, complition: nil)
                
                DispatchQueue.main.async {
                    self.present(alertSheet, animated: true, completion: nil)
                }
            }
        })
    }
    
    @IBAction func backButtonHandler(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
