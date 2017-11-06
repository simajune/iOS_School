//
//  ViewController.swift
//  LoginTest
//
//  Created by SIMA on 2017. 11. 3..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import Firebase
//import FirebaseAuth


class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        //loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        loginButton.center = view.center
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
        
        let customFBButton = UIButton(type: .system)
        customFBButton.backgroundColor = .blue
        customFBButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
        customFBButton.setTitle("Login Here", for: .normal)
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(customFBButton)
        
        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
    }
    
    @objc func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, error) in
            if error != nil {
                print("custom FB Login Failed", error ?? "")
                return
            }
            self.showEmailAdress()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("log out")
        let logout = FBSDKLoginManager()
        logout.logOut()

    }	
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        }
        showEmailAdress()
        let MapView = UIStoryboard(name: "Main", bundle: nil)
        if let MapVC = MapView.instantiateViewController(withIdentifier: "MapView") as? MapViewController {
            self.present(MapVC, animated: true, completion: nil)
        }
        
    }
    
    func showEmailAdress() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentails) { (user, error) in
            if error != nil {
                print("Something went wrong with our FB user ", error ?? "")
                return
            }
            print("Successful logged in with our user: ", user ?? "")
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email, gender, updated_time"]).start { (connection, result, err) in
            if err != nil {
                print("error for graph Request", err ?? "")
                return
            }
            print(result ?? "")
        }
    }
}

