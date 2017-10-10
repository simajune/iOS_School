//
//  ViewController.swift
//  171010_UIViewController
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 60))
    let subView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//UIView
        
        subView.frame = CGRect(x: -50, y: 0, width: 50, height: view.frame.size.height)
        subView.backgroundColor = UIColor.blue
        view.addSubview(subView)
        
        
//End UIView
//
////UILabel
//        let labelView: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: 50))
//        labelView.text = "taejune"
//        labelView.textAlignment = .center
//        view.addSubview(labelView)
////End UILabel
//
////UIImageView
//        let imageView: UIImageView = UIImageView()
//        imageView.frame = CGRect(x: 0, y: 300, width: 375, height: 375)
//        imageView.image = UIImage(named: "joyfulchurch")
//        view.addSubview(imageView)
////End UIImageView
//
//UIButton
        btn.backgroundColor = .red
        btn.setTitle("버튼 클릭", for: .normal)
        btn.setTitle("눌리는 중", for: .highlighted)
        btn.addTarget(self, action: #selector(self.btnClicked(_:)) , for: .touchUpInside)

        view.addSubview(btn)
////End UIButton
//
////UITextField
//
//        let textField: UITextField = UITextField(frame: CGRect(x: 0, y: 80, width: 375, height: 40))
//
//        textField.text = "입력하세요"
//        textField.borderStyle = .roundedRect
//        view.addSubview(textField)
//
//
//        UIView.animate(withDuration: 1.0) {
//            subView.frame.origin.y += 200
//            //view.layoutIfNeeded()
//        }
//
    }
    
    
    @objc func btnClicked (_ sender: UIButton) {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            btn.setTitle("눌림", for: .selected)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.frame.origin.x += 50
                //self.subView.frame.origin.x += 50
            })
            
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.frame.origin.x -= 50
                //self.subView.frame.origin.x -= 50
            })
            
        }
        
    }



}

