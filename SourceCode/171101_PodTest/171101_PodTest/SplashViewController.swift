//
//  ViewController.swift
//  171101_PodTest
//
//  Created by SIMA on 2017. 11. 1..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var isLogined: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isLogined {
            let mainVC = UIStoryboard(name: "Main", bundle: nil)
            if let mainNavi = mainVC.instantiateViewController(withIdentifier: "MainNavi") as? UINavigationController {
                self.present(mainNavi, animated: true, completion: nil)
            }
        }
        
    }

}

