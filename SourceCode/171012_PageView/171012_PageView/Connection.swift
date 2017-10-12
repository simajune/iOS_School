//
//  Connection.swift
//  171012_PageView
//
//  Created by SIMA on 2017. 10. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class Connection: UIViewController {
    //MARK: - Variable
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backGroundImageName = NSDefault.object(forKey: "ConnectioBackGroundImageName") as! String
        
        backGroundImageView.image = UIImage(named: backGroundImageName)
        
        // Do any additional setup after loading the view.
    }



}
