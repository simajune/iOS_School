//
//  ViewController.swift
//  170925_UI
//
//  Created by SIMA on 2017. 9. 25..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let test1View: UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
//        test1View.backgroundColor = UIColor.blue
//        view.addSubview(test1View)
//        
//        let test2View: UIView = UIView(frame: CGRect(x: 15, y: view.frame.maxY - 115, width: 345, height: 100))
//        test2View.backgroundColor = UIColor.blue
//        test2View.alpha = 0.5
//        test2View.layer.cornerRadius = 10
//        test2View.layer.borderColor = UIColor.black.cgColor
//        test2View.layer.borderWidth = 1.0
//        view.addSubview(test2View)

//        let test3View: UIView = UIView(frame: CGRect(x: 15, y: 15, width: self.view.frame.width - 30, height: 100))
//        test3View.backgroundColor = UIColor.darkGray
//        view.addSubview(test3View)
        //간격이 다 같게 갯수를 늘려 하기
        //프레임 연습하기
        //UI레이블
        //UIView, UIImageView
        
        let test4View: UILabel = UILabel(frame: CGRect(x: 20.0, y: 20, width: 50, height: 50))
        test4View.numberOfLines = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

