//
//  ViewController.swift
//  171106_Thread
//
//  Created by SIMA on 2017. 11. 6..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var firstIndicator: UIActivityIndicatorView!
    @IBOutlet weak var secondIndicator: UIActivityIndicatorView!
    @IBOutlet weak var thirdIndicator: UIActivityIndicatorView!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //useWorkItem()
        firstIndicator.startAnimating()
        secondIndicator.startAnimating()
        thirdIndicator.startAnimating()
        
        gcdImage()
        
    }
    
    func gcdImage() {
        DispatchQueue.global().async {
            
            if let data = try? Data(contentsOf: URL(string: "http://image.koreatimes.com/article/2015/12/23/20151223114014561.jpg")!) {
                DispatchQueue.main.async {
                    self.secondImage.image = UIImage(data: data)
                    self.secondIndicator.stopAnimating()
                }
                
            }
            print(3)
            
            if let data = try? Data(contentsOf: URL(string: "http://www.v3wall.com/wallpaper/1920_1080/1408/1920_1080_20140808025908818359.jpg")!) {
                DispatchQueue.main.async {
                    self.thirdImage.image = UIImage(data: data)
                    self.thirdIndicator.stopAnimating()
                }
                
            }
            
            if let data = try? Data(contentsOf: URL(string: "http://www.dogdrip.net/files/attach/images/19201543/811/352/054/b74d690e2bedccaca99988bdd3907b14.jpg")!) {
                DispatchQueue.main.async {
                    self.firstImage.image = UIImage(data: data)
                    self.firstIndicator.stopAnimating()
                }
                
            }
        }
    }
//    func gcd() {
//        DispatchQueue.global().async {
//
//        }
//        DispatchQueue.global().sync {
//
//        }
//    }
    
//    func gcdTest() {
//        let q1 = DispatchQueue(label: "com.q1", qos: .userInitiated, attributes: .concurrent)
//        let q2 = DispatchQueue(label: "com.q2", qos: .background, attributes: .concurrent)
//        let q3 = DispatchQueue(label: "com.q3", qos: .default, attributes: .concurrent)
//
//        for index in 0 ... 10000 {
//
//        }
//    }
//
//
//    func useWorkItem() {
//        var value = 10
//        let workItem = DispatchWorkItem {
//            value += 5
//        }
//        //workItem.perform()
//        let queue = DispatchQueue.global(qos: .utility)
//        //queue.async(execute: workItem)
//        workItem.notify(queue: DispatchQueue.main) {
//            print("value = ", value)
//        }
//    }

}
//var cache: [String: Date] = [:]
//
//extension UIImageView {
//    func imageForURL (_ urlStr: String) {
//        if cache.keys.contains(urlStr) {
//            let data = cache[urlStr]!
//            self.image = UIImage(data: data)
//
//        }else {
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: URL(string: urlStr)!) {
//                    DispatchQueue.main.async {
//                        self.image = UIImage(data: data)
//                    }
//                    cache.updateValue(data, forKey: urlStr)
//                }
//            }
//        }
//    }
//}

