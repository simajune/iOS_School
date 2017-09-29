//
//  ViewController.swift
//  170929_UIViewController
//
//  Created by SIMA on 2017. 9. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //뷰 생성
        createView()
        updateLayout()
        
    }
    //클로져를 이용하여 인스턴스 생성 - 스위프트에선 많이 사용
    let subView2: UIView = {
        let subViewer: UIView = UIView()
        subViewer.backgroundColor = .black
        return subViewer
    }()
    weak var scrollView: UIScrollView!
    weak var subView: UIView!
    weak var lb: UILabel!
    weak var btn: UIButton!
    
    func createView() {
        
        //UIScrollView - UITableVIew - UICollectionView
        let scrollView: UIScrollView = UIScrollView()
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        self.scrollView = scrollView
        
        
        //UIVIew
        let subView: UIView = UIView()
        subView.backgroundColor = UIColor(red: 122/255, green: 0.5, blue: 0.5, alpha: 1)
        //뷰 추가
        view.addSubview(subView)
        self.subView = subView
        //UILabel, UIImageView, UIScrollView
        
        //UILabel
        let lb: UILabel = UILabel()
        lb.text = "안녕"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.tag = 10
        scrollView.addSubview(lb)
        self.lb = lb
        
        //UIButton
        let btn: UIButton = UIButton(type: .system)
        btn.setTitle("버튼이름", for: .normal)
        btn.addTarget(self, action: #selector(ViewController.btnClicked(_:)), for: .touchUpInside)
        //확인해보기
        //btn.titleLabel?.text = "눌림"
        //view.addSubview(btn)
        scrollView.addSubview(btn)
        self.btn = btn
        

        
        //UIControl - addTarget
        //UIButton, UISwitch, UISlider, UITextField
        //UITextView
        
    }
    
    func btnClicked(_ sender: UIButton) {
        
    }
    
    func updateLayout() {
        subView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        lb.frame = CGRect(x: 20, y: 20, width: 100, height: 50)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        scrollView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        scrollView.contentSize = CGSize(width: 10*scrollView.frame.width, height: 1000)

        
    }

}

