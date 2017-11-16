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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: UIButton) {
//        guard let userName = idTextField.text else { return }
//        guard let userPW = pwTextField.text else { return }
        let userName = "tjtjtjtj"
        let userPW = "asd123asd123"
        
        NetworkManager.shared.requestLogin(userID: userName, userpw: userPW) { (isSuccess, resultData, error) in
            if isSuccess {
                print("login Success")
            }else {
                print(error?.localizedDescription)
                print("로그인 실패")
            }
        }
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        
        
    }
    func checkData() -> Bool {
        return true
    }
}

