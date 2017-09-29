//
//  CustomCell.swift
//  170929_TableView
//
//  Created by SIMA on 2017. 9. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var imgView: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createView() {
        imgView = UIImageView()
        self.addSubview(imgView!)
    }
    
    func setImgName(name: String) {
        imgView?.image = UIImage(named: name)
    }
    
    //레이아웃이 변경 될 때마다(Cell이 뭐하나라도 변경이 될 때마다) 실행
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    func updateLayout() {
        imgView?.frame = self.bounds
    }
}
