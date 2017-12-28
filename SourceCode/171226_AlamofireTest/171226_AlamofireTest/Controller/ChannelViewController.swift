//
//  ChannelViewController.swift
//  171226_AlamofireTest
//
//  Created by SIMA on 2017. 12. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
     
    }

    @IBAction func loginBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
        
    }
}
