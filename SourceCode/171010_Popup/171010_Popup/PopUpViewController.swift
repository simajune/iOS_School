//
//  PopUpViewController.swift
//  171010_Popup
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popupImgView: UIImageView!
    @IBOutlet weak var popupImgHeight: NSLayoutConstraint!
    @IBOutlet weak var popupAnimatedY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupAnimatedY.constant = 1000
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.popupAnimatedY.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (popupImgView.image?.size.width)! / popupImgView.frame.size.width
        let resultHeight = (popupImgView.image?.size.height)! / ratio
        popupImgHeight.constant = resultHeight
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }


}
