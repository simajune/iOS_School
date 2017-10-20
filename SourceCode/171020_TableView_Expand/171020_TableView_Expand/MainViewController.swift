//
//  ViewController.swift
//  171020_TableView_Expand
//
//  Created by SIMA on 2017. 10. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomTableViewCellDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    
    var onOffList: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.tableHeaderView?.backgroundColor = .blue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "only"
        }else {
            return "good"
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onOffList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        cell.textLabel?.text = "\(indexPath.row)"
        cell.switchValue = onOffList[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
    
    func switchTAbleView(_ cell: CustomTableViewCell, didchangedSwitch value: Bool) {
        //print("change Switch \(cell.indexPath?.row)")
        onOffList[cell.indexPath!.row] = value
    }

}

