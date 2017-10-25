//
//  MemberTableViewCell.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    var data: MemberData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        self.imageView?.frame = CGRect(x: 0, y: 0, width: 55, height: self.frame.height)
        self.textLabel?.frame = CGRect(x: (self.imageView?.frame.maxX)! + 10, y: 10, width: self.frame.maxX - (self.imageView?.frame.maxX)! - 20, height: 20)
        self.detailTextLabel?.frame = CGRect(x: (self.imageView?.frame.maxX)! + 10, y: (self.textLabel?.frame.maxY)! + 5, width: self.frame.maxX - (self.imageView?.frame.maxX)! - 20, height: 15)
    }

}
