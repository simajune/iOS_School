//
//  LoginViewController.swift
//  171226_AlamofireTest
//
//  Created by SIMA on 2017. 12. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func closeBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil	)
    }
    @IBAction func createAccountBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
