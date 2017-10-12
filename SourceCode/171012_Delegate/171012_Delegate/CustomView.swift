//
//  CustomView.swift
//  171012_Delegate
//
//  Created by SIMA on 2017. 10. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var delegate: CustomViewDelegate?
    @IBOutlet var titleLB: UILabel!
    @IBOutlet var contentsImage: UIImageView!
    @IBOutlet var isOnSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //isOnSwitch.addTarget(self, action: #selector(self.onOffSwitch(_:)), for: .touchUpInside)
    }
    
    @objc func onOffSwitch(_ sender: UISwitch) {
        
    }
    
    @IBAction func isOnSwitch(_ sender: UISwitch) {
        delegate?.isOnOffDelegate(self)
    }
    
}

protocol CustomViewDelegate {
    func isOnOffDelegate(_ customView: CustomView)
}
