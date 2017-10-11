//
//  SecondViewController.swift
//  171011_NavigationController
//
//  Created by SIMA on 2017. 10. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "NextView"
        // Do any additional setup after loading the view.
    }
}
