//
//  MainViewController.swift
//  170927_LoginClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var textLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLB = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        textLB.text = "로그인 성공"
        view.addSubview(textLB)
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
