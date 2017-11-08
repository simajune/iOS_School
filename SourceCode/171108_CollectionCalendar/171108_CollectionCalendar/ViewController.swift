//
//  ViewController.swift
//  171108_CollectionCalendar
//
//  Created by SIMA on 2017. 11. 8..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tjCalendar: TJCalendar!
    @IBOutlet weak var yearTitle: UILabel!
    @IBOutlet weak var monthTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tjCalendar.date = Date()
        
        yearTitle.text = "\(tjCalendar.year!)" + " 년"
        monthTitle.text = "\(tjCalendar.month!)" + " 월"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func prevMonthButton(_ sender: UIButton) {
        tjCalendar.updatePrevMonth()
        yearTitle.text = "\(tjCalendar.year!)" + " 년"
        monthTitle.text = "\(tjCalendar.month!)" + " 월"
    }
    
    @IBAction func nextMonthButton(_ sender: UIButton) {
        tjCalendar.updateNextMonth()
        yearTitle.text = "\(tjCalendar.year!)" + " 년"
        monthTitle.text = "\(tjCalendar.month!)" + " 월"
    }
    
    
}
