//
//  YourBubbleTableViewCell.swift
//  171011_KakaoClone
//
//  Created by SIMA on 2017. 10. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class YourBubbleTableViewCell: UITableViewCell {

    @IBOutlet weak var yourBubbleText: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
