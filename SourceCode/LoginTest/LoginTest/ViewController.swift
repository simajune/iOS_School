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
    
//    @IBAction func kakaoAction(_ sender: Any) {
//
//
//        let session :KOSession = KOSession.shared()
//        if session.isOpen() {
//            session.close()
//        }
//        session.presentingViewController = self
//        session.open(completionHandler: {(error) -> Void in
//            // 카카오 로그인 화면에서 벋어날 시 호출됨. (취소일 때도 표시됨)
//            if error != nil {
//                print(error?.localizedDescription ?? "")
//            }else if session.isOpen() {
//
//                print(KOSession.shared().accessToken)
//
//                //let token = KOPushTokenInfo.init()
//
//                /*
//                KOSessionTask.meTask(completionHandler: {(profile, error) -> Void in
//                    KOSessionTask.accessTokenInfoTask(completionHandler: { (tokenInfo, error) in
//                        if error != nil {
//                            print(error!.localizedDescription)
//                        } else {
//                            KOSession.shared().accessToken
//
//                            print(KOSession.shared().accessToken)
//                            guard let tokenID = KOSession.shared().accessToken else { return }
//
//                            Auth.auth().signIn(withCustomToken: tokenID, completion: { (user, error) in
//                                print(error?.localizedDescription)
//                                print(user)
//                            })
//                        }
//                    })
//                    if profile != nil {
//                        print(profile)
//                        DispatchQueue.main.async(execute: { () -> Void in
//                            let kakao : KOUser = profile as! KOUser
//                            print(kakao.properties)
//                        })
//                    }
//                })*/
//            }
//        })
//    }
    
    func showEmailAdress() {
  
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentails) { (user, error) in
            if error != nil {
                print("Something went wrong with our FB user ", error ?? "")
                return
            }
            print(user?.providerID)
            print("Successful logged in with our user: ", user ?? "")
            
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email, gender, updated_time"]).start { (connection, result, err) in
            if err != nil {
                
                print("error for graph Request", err ?? "")
                return
            }
            
            print("----------------")
            print(result ?? "")
        }
    }
}

