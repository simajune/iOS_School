//
//  ViewController.swift
//  180930_UIAlertController
//
//  Created by SIMA on 2018. 4. 30..
//  Copyright © 2018년 devtejay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertAction(_ sender: UIButton) {
        let alertVC = UIAlertController.init(title: "타이틀",
                                             message: "알럿 메세지",
                                             preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "확인",
                                          style: .default) { (action) in
                                            //버튼 클릭시 실행 코드
        }
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true) {
            //알럿 띄운 후 실행할 액션
        }
    }
    
}

