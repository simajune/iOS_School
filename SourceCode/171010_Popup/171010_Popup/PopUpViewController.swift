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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
