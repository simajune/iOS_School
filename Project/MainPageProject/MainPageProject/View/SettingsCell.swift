//
//  SettingsCell.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 25..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var autoLoginSwitch: UISwitch!
    @IBOutlet weak var versionLb: UILabel!
    var isSwitchOn: Bool = UserDefaults.standard.bool(forKey: "autoLogin")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if isSwitchOn {
            autoLoginSwitch.isOn = true
        }else {
            autoLoginSwitch.isOn = false
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func autoLoginSwitch(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "autoLogin")
            UserDefaults.standard.bool(forKey: "autoLogin")
        }else {
            UserDefaults.standard.set(false, forKey: "autoLogin")
        }
        
    }
}
