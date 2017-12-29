//
//  CreateViewController.swift
//  171226_AlamofireTest
//
//  Created by SIMA on 2017. 12. 30..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
