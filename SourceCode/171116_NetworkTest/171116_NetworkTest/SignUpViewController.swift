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

       
    }
    @IBAction func signupConfimButton(_ sender: UIButton) {
        let userID = idTextField.text
        let userPW = pwTextField.text
        let userRePW = repwTextField.text
        
        NetworkManager.shared.requestSignup(userid: userID!, pw: userPW!, repw: userRePW!, completion: { (isSuccess, resultData, error) in
            if isSuccess {
                print("signup Success")
                
            }else {
//                print(error?.localizedDescription)
            }
        })
    }
}
