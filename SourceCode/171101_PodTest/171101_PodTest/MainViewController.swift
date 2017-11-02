//
//  MainViewController.swift
//  171101_PodTest
//
//  Created by SIMA on 2017. 11. 1..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit
import ViewAnimator

class MainViewController: UIViewController {

    var firstButtonCount: Int = 0
    var secondButtonCount: Int = 0
    var thirdButtonCount: Int = 0
    var fourthButtonCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedFirstButton(_ sender: UIButton) {
        firstButtonCount += 1
        print("firstButtonCount", firstButtonCount)
    }
    @IBAction func clickedSecondButton(_ sender: UIButton) {
        secondButtonCount += 1
        print("secondButtonCount", secondButtonCount)
    }
    @IBAction func clickedThirdButton(_ sender: UIButton) {
        thirdButtonCount += 1
        print("thirdButtonCount", thirdButtonCount)
    }
    @IBAction func clickedFouthButton(_ sender: UIButton) {
        fourthButtonCount += 1
        print("fourthButtonCount", fourthButtonCount)
    }
//    @IBAction func clickedResultButton(_ sender: UIButton) {
//        //prepare(for: ResultViewController, sender: self)
//        prepare(for: CustomSegue, sender: self)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let detinationViewController = segue.destination as! ResultViewController
            
            detinationViewController.firstnum = CGFloat(firstButtonCount)
            detinationViewController.secondnum = CGFloat(secondButtonCount)
            detinationViewController.thirdnum = CGFloat(thirdButtonCount)
            detinationViewController.fourthnum = CGFloat(fourthButtonCount)
        }
    }
    
}
