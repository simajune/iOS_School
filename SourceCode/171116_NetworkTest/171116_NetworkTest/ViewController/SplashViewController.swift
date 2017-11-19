//
//  SplashViewController.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 16..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "TokenKey") != nil {
            //print(UserDefaults.standard.string(forKey: "TokenKey"))
            if let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController {
                self.navigationController?.pushViewController(mainVC, animated: true)
            }
        }else {
            if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? ViewController {
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }

}
