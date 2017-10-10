//
//  SecondViewController.swift
//  171010_UIViewController
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var sendedMsg: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        let closeButton = UIButton()
        closeButton.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        closeButton.setTitle("닫기", for: .normal)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(self.btnClicked(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
        print("viewdidload")
        resultLabel.text = sendedMsg
        
    }
    
    @objc func btnClicked (_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func sendMessage(_ msg: String) {
        sendedMsg = msg
        print("sendmsg")
    }
}
