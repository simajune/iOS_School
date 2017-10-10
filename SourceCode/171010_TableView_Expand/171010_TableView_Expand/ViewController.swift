//
//  ViewController.swift
//  171010_TableView_Expand
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    
}



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var heightArray: NSMutableArray = []
    var textArray: NSArray = ["short Text",
                              "long long long long long long Text",
                              "very long long long long long long long long long long long long Text",
                              "very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long Text"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0 ... 14 {
            heightArray.add(false)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        
        
        cell.myLabel.text = textArray[indexPath.row % textArray.count] as? String
        
        if heightArray[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        }else {
            cell.myLabel.numberOfLines = 0
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if heightArray[indexPath.row] as! Bool == true {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }else {
            heightArray.replaceObject(at: indexPath.row, with: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

