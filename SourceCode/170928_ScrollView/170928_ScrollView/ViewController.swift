//
//  ViewController.swift
//  170928_ScrollView
//
//  Created by SIMA on 2017. 9. 28..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var leftLB: UILabel!
    var rightLB: UILabel!
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
//        view.addSubview(scrollView)
//        scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.size.height)
//        scrollView.bounces = false
        //scrollView.isPagingEnabled = true
        //scrollView.backgroundColor = UIColor.brown
//
//        for n in 0..<10 {
//            let fisrtview: UIView = UIView(frame: CGRect(x: n*100, y: 0, width: 100, height: 100))
//            fisrtview.backgroundColor = UIColor(red: CGFloat(n)*25/255.0, green: CGFloat(n)*25/255.0, blue: CGFloat(n)*25/255.0, alpha: 1)
//            scrollView.addSubview(fisrtview)
//        }
//        for n in 0..<10 {
//            let secondview: UIView = UIView(frame: CGRect(x: n*100, y: 100, width: 100, height: 100))
//            secondview.backgroundColor = UIColor(red: (250 - CGFloat(n)*25)/255.0, green: (250 - CGFloat(n)*25)/255.0, blue: (250 - CGFloat(n)*25)/255.0, alpha: 1)
//            scrollView.addSubview(secondview)
//        }
        
        //leftLB = UILabel(frame: CGRect(x: -50, y: view.frame, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    
        
        
        
        scrollView =  UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        scrollView.contentSize = CGSize(width: 3*view.frame.size.width, height: view.frame.size.height)
        //scrollView.delegate = self
        scrollView.bounces = true
        scrollView.isPagingEnabled = false
        view.addSubview(scrollView)
        
        let firstView: UIView = UIView(frame: CGRect(x: 0, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
        firstView.backgroundColor = UIColor.blue
        scrollView.addSubview(firstView)
        
        let secondView: UIView = UIView(frame: CGRect(x: view.frame.size.width, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
        secondView.backgroundColor = UIColor.green
        scrollView.addSubview(secondView)
        
        let thirdView: UIView = UIView(frame: CGRect(x: 2*view.frame.size.width, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
        thirdView.backgroundColor = UIColor.red
        scrollView.addSubview(thirdView)
        
//        
//        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        pageControl.numberOfPages = 10
//        pageControl.backgroundColor = UIColor.black
//        pageControl.currentPage = 0
//        view.addSubview(pageControl)
        

    }
    //스크롤이 될때마다 실행
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        scrollView.setContentOffset(CGPoint(x: 400, y: 0), animated: true)
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        scrollView.setContentOffset(CGPoint(x: 100, y: 100), animated: true)
//
//    }

}

