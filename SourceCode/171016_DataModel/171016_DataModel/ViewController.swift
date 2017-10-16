//
//  ViewController.swift
//  171016_DataModel
//
//  Created by SIMA on 2017. 10. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userDic: [UserModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = [["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1],
                   ["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1],
                   ["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1]]
        
        
//        for dic in list {
//            self.userDic.append([UserModel(dic)])
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

