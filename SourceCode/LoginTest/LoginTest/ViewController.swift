//
//  ViewController.swift
//  LoginTest
//
//  Created by SIMA on 2017. 11. 3..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 20, y: 50, width: 100, height: 100)
        
        loginButton.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("log out")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        }
        print("facebook login success")
        
    }
}

