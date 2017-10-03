//
//  ViewController.swift
//  170925_UI
//
//  Created by SIMA on 2017. 9. 25..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var postingLb: UILabel!
    var isclicked: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //간격이 다 같게 갯수를 늘려 하기
        //프레임 연습하기
        //UI레이블
        //UIView, UIImageView
        
        let naviBar: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height:60))
        view.addSubview(naviBar)
        naviBar.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 0.8)
        
        let naviText: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 40))
        naviBar.addSubview(naviText)
        naviText.text = "@Taejune"
        naviText.textAlignment  = .center
        
        
        let bottomLayer: UIView = UIView(frame: CGRect(x: 0, y: naviBar.frame.height - 1, width: naviBar.frame.width, height: 1))
        bottomLayer.backgroundColor = UIColor.lightGray
        view.addSubview(bottomLayer)
        
        
        let cat1View: UIImageView = UIImageView(frame: CGRect(x: 10, y: naviBar.frame.height + 20, width: 80, height: 80))
        cat1View.image = UIImage(named: "cat1.JPG")
        view.addSubview(cat1View)

        let postNumber: UILabel = UILabel(frame: CGRect(x: cat1View.frame.maxX + 30, y: naviBar.frame.maxY + 30, width: 50, height: 20))
        view.addSubview(postNumber)
        postNumber.text = "2M"
        postNumber.textColor = UIColor.lightGray
        
        let followerNumber: UILabel = UILabel(frame: CGRect(x: postNumber.frame.maxX + 40, y: naviBar.frame.maxY + 30, width: 50, height: 20))
        view.addSubview(followerNumber)
        followerNumber.text = "1M"
        followerNumber.textColor = UIColor.lightGray
        
        let followingNumber: UILabel = UILabel(frame: CGRect(x: followerNumber.frame.maxX + 40, y: naviBar.frame.maxY + 30, width: 50, height: 20))
        view.addSubview(followingNumber)
        followingNumber.text = "100K"
        followingNumber.textColor = UIColor.lightGray
        
        
        let postLb: UILabel = UILabel(frame: CGRect(x: cat1View.frame.maxX + 25, y: postNumber.frame.maxY + 2, width: 50, height: 20))
        view.addSubview(postLb)
        postLb.font = UIFont.boldSystemFont(ofSize: 14)
        postLb.text = "posts"

        let followerLb: UILabel = UILabel(frame: CGRect(x: postLb.frame.maxX + 28, y: postNumber.frame.maxY + 2, width: 70, height: 20))
        view.addSubview(followerLb)
        followerLb.font = UIFont.boldSystemFont(ofSize: 14)
        followerLb.text = "followers"
        
        let followingLb: UILabel = UILabel(frame: CGRect(x: followerLb.frame.maxX + 23, y: postNumber.frame.maxY + 2, width: 100, height: 20))
        view.addSubview(followingLb)
        followingLb.font = UIFont.boldSystemFont(ofSize: 14)
        followingLb.text = "followings"

        
        postingLb = UILabel()
        postingLb.frame = CGRect(x: 10, y: cat1View.frame.maxY + 10, width: 100, height: 20)
        view.addSubview(postingLb)
        postingLb.font = UIFont.boldSystemFont(ofSize: 14)
        postingLb.text = "Hi, i'm Tjay" + "🙉"
        
        
        //let btn: UIButton = UIButton()
        let btn: UIButton = UIButton(type: UIButtonType.system)
        btn.frame = CGRect(x: postLb.frame.maxX + 10, y: followerLb.frame.maxY + 2, width: 100, height: 30)
        btn.setTitle("Follow Me", for: UIControlState.normal)
        //btn.setTitle("눌렀네", for: UIControlState.highlighted)
//        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
//        btn.setTitleColor(UIColor.brown, for: UIControlState.highlighted)
        
//        btn.layer.cornerRadius = 10
//        btn.layer.borderColor = UIColor.black.cgColor
//        btn.layer.borderWidth = 1.0
        //btn.setBackgroundImage(#imageLiteral(resourceName: "cat2.JPG"), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(ViewController.btnclicked(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        btn.titleLabel?.textColor = UIColor.white
        
        
        
        
        
//        
//        let testBtn: UIButton = UIButton(type: .system)
//        view.addSubview(testBtn)
//        testBtn.frame = CGRect(x: 20, y: 300, width: 100, height: 100)
//        testBtn.setTitle("test", for: .normal)
//        //testBtn.setTitle("highlighted", for: .highlighted)
//        testBtn.setTitle("selected", for: .selected)
//        testBtn.setTitleColor(.yellow, for: .normal)
//        testBtn.setTitleColor(.black, for: .highlighted)
//        testBtn.setTitleColor(.blue, for: .selected)
//        testBtn.backgroundColor = .red
//        testBtn.addTarget(self, action: #selector(self.testBtnClicked(_:)), for: .touchUpInside)
//        
//        
    }
//    @objc func testBtnClicked (_ sender: UIButton){
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }

    
    
    
    @objc func btnclicked (_ sender: UIButton){
        if isclicked {
            postingLb.text = "Hi, i'm Tjay" + "🙉"
            isclicked = false
        }else {
            postingLb.text = "버튼 누름"
            isclicked = true
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

