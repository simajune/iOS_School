//
//  MyBubbleTableViewCell.swift
//  171011_KakaoClone
//
//  Created by SIMA on 2017. 10. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {

    @IBOutlet weak var myBubbleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
