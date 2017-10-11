//
//  SegueViewController.swift
//  171010_UIViewController
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var textFieldView: UITextField!
    var isEnable: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func enableSwitch(_ sender: UISwitch) {
        isEnable = sender.isOn
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "nextSecondVC" {
                return isEnable
        }else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendStr = textFieldView.text ?? "no Text"
        print("sendStr")
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.sendMessage(sendStr)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
