//
//  ViewController.swift
//  171001_Segue
//
//  Created by SIMA on 2018. 5. 3..
//  Copyright © 2018년 devtejay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "toVC", sender: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    
    }
    
}

