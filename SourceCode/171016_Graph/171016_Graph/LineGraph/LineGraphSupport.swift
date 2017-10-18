//
//  LineGraphSupport.swift
//  171016_Graph
//
//  Created by SIMA on 2017. 10. 17..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class LineGraphSupport: UIView {
    override func draw(_ rect: CGRect) {
        //Data
        let data = [1750, 2300, 2200, 1480, 1200, 1800, 1300]
        
        //X axis
        let xPoint = {(column: Int) -> CGFloat in
            let spacer = rect.width / CGFloat(data.count - 1)
            let x = CGFloat(column) * spacer
            
            return x
        }
        
        //Y axis
        
        
    }
    
}
