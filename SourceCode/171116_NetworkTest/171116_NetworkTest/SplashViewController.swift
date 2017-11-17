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
            print(UserDefaults.standard.string(forKey: "TokenKey"))
            performSegue(withIdentifier: "MainSegue", sender: self)
        }else {
            performSegue(withIdentifier: "LoginSegue", sender: self)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
