//
//  SettingsViewController.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 25..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var dataCenter: DataCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCenter = DataCenter()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataCenter?.settings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataCenter!.settings.count)
        return dataCenter?.settings[section].datas.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataCenter?.settings[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let settingItem = dataCenter?.settings[indexPath.section]
        let detailSettingItem = settingItem?.datas[indexPath.row]
        
        cell.textLabel?.text = detailSettingItem?.content
        return cell
    }

}
