//
//  PostCell.swift
//  FastcampusInstagram
//
//  Created by SIMA on 2017. 11. 23..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var userProfileImgView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImgView: UIImageView!
    @IBOutlet weak var postContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadComplete), name: .myNotification, object: nil)
    }
    
    @objc func loadComplete() {

    }
    
}
