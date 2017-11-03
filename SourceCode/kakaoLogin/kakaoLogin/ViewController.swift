//
//  ViewController.swift
//  KakaoLogin
//
//  Created by SIMA on 2017. 11. 3..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var session: KOSession? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = KOSession.shared()!

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        
        if let s = session {
            if s.isOpen() {
                s.close()
            }
            s.open(completionHandler: { (error) in
                if error == nil {
                    print("No error")
                    
                    if s.isOpen() {
                        print("Success")
                    }else  {
                        print("Fail")
                    }
                    
                }else {
                    print("errorLogined")
                }
            })
        }else {
            print("somethingelse")
        }
//
//
//        if session.isOpen() {
//            session.close()
//        }
//        session.presentingViewController = self
        
        }
}

