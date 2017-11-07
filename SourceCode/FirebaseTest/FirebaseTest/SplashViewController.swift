//
//  SplashViewController.swift
//  FirebaseTest
//
//  Created by SIMA on 2017. 11. 7..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    
    @IBOutlet weak var titleLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLb.alpha = 0
        UIView.animate(withDuration: 2.5, animations: {
            self.titleLb.alpha = 1
        }) { (action) in
            let loginStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            if let loginVC = loginStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController {
                self.present(loginVC, animated: true, completion: nil)
            }
        }
    }


}
