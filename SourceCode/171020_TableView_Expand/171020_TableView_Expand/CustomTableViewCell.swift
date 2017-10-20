//
//  CustomTableViewCell.swift
//  171020_TableView_Expand
//
//  Created by SIMA on 2017. 10. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var indexPath: IndexPath?
    var delegate: CustomTableViewCellDelegate?
    @IBOutlet weak var switchData: UISwitch!
    
    var switchValue: Bool = true {
        willSet {
            self.switchData.isOn = newValue
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        print(sender.isOn, "\(indexPath!.row)")
        delegate?.switchTAbleView(self, didchangedSwitch: sender.isOn)
    }
    
}

protocol CustomTableViewCellDelegate{
    func switchTAbleView(_ cell: CustomTableViewCell, didchangedSwitch value: Bool)
}
