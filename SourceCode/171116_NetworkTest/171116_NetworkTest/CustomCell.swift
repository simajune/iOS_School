//
//  CustomCell.swift
//  miniSNS
//
//  Created by SIMA on 2017. 11. 9..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contentBGView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentsLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.layer.cornerRadius = mainImageView.frame.size.height / 2
        mainImageView.clipsToBounds = true
        contentBGView.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
