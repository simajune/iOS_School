//
//  ViewController.swift
//  171012_Delegate
//
//  Created by SIMA on 2017. 10. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    @IBOutlet weak var newView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newView.delegate = self
    }
    
    func isOnOffDelegate(_: CustomView) {
        if newView.isOnSwitch.isOn {
            newView.titleLB.text = "스위치 온"
            newView.contentsImage.image = UIImage(named: "On")
        }else {
            newView.titleLB.text = "스위치 오프"
            newView.contentsImage.image = UIImage(named: "Off")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

