//
//  ChannelViewController.swift
//  171226_AlamofireTest
//
//  Created by SIMA on 2017. 12. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
     
    }

}
