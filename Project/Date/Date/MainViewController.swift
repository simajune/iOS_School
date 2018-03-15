//
//  MainViewController.swift
//  Date
//
//  Created by SIMA on 2018. 3. 14..
//  Copyright © 2018년 devtejay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Property
    var dateFormatter: DateFormatter = DateFormatter()
    
    //MARK: - IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBAction
    @IBAction func confirmBtnAction(_ sender: UIButton) {
        
    }
}
