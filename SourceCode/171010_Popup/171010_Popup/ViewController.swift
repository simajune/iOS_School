//
//  ViewController.swift
//  171010_Popup
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
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

    @IBAction func showPopUp(_ sender: Any) {
        let PopUpControl: PopUpViewController = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        PopUpControl.modalPresentationStyle = .overCurrentContext
        
        present(PopUpControl, animated: false, completion: nil)
        
    }
    
}

