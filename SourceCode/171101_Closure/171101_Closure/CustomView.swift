//
//  CustomView.swift
//  171101_Closure
//
//  Created by SIMA on 2017. 11. 1..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var delegate: CustomViewDelegate?
    var closureButton: ((CustomView) -> Void)?
    
    @IBOutlet weak var customLb: UILabel!
    
    @IBAction func didselectedBtn(_ sender: UIButton) {
        delegate?.selectedView(self)
        //
        closureButton?(self)
        //
        //closureButton("asd")
    }
//
//    func didSelectedClosure ( closure: @escaping (CustomView) -> Void) {
//        closureButton = closure
//    }
    
 
}

protocol CustomViewDelegate {
    func selectedView(_ customView: CustomView)
}
