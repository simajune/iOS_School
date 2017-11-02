//
//  CustomCell.swift
//  CoverFlowTest
//
//  Created by SIMA on 2017. 10. 31..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell, CoverFlowDelegate {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTextView: UITextView!
    
    var mainVC: ViewController!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        mainVC = ViewController()
        
//        let gesture = UITapGestureRecognizer(target: mainVC, action: #selector(mainVC.tapLyric(_:)))
//        
//        cellTextView.addGestureRecognizer(gesture)
    }
    
    func textViewScale(_ coverFlow: CoverFlowLayout) {
        if coverFlow.scale == 0.5 {
            
        }
    }
    
    
}
