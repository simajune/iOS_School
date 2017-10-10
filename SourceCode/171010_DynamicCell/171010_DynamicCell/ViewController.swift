//
//  ViewController.swift
//  171010_DynamicCell
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {
    
    @IBOutlet weak var contentsLB: UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var emailTableView: UITableView!
    var emailData: [String] = ["short Text",
                                     "long long long long long long Text",
                                     "very long long long long long long long long long long long long Text",
                                     "very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long Text"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! EmailCell
        
        cell.contentsLB.text = emailData[indexPath.row % emailData.count]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

