//
//  RoundButton.swift
//  170927_LoginClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var radius: CGFloat = 0 {
        willSet {
          self.layer.cornerRadius = newValue
        }
    }
    
    
}
