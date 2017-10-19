//
//  ContentsViewController.swift
//  171019_TableView
//
//  Created by SIMA on 2017. 10. 19..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ContentsViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
       
    }

    @IBAction func saveBtn(_ sender: UIButton) {
        let name = inputTextField.text ?? ""
        DataCenter.mainCenter.addName(name)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
