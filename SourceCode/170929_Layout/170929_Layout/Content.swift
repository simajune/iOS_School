//
//  Content.swift
//  170929_Layout
//
//  Created by SIMA on 2017. 9. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class Content: UIViewController {

//MARK: - Variable
    var itemGroupIndex = Int()
    var itemIndex = Int()
    
    var itemGroupSetData = [ItemGroup]()
    var itemGroupData = ItemGroup()
    var itemData = Item()
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var platformLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        
        //Data
        
        
        
        itemGroupIndex = NSDefault.object(forKey: "ItemGroupIndex") as! Int
        print(itemGroupIndex)
        itemIndex = NSDefault.object(forKey: "ItemIndex") as! Int
        print(itemIndex)
        
        itemGroupSetData = ItemGroup().AddItem()
        itemGroupData = itemGroupSetData[itemGroupIndex]
        itemData = itemGroupData.ItemSet[itemIndex]
        
        let contentImageName = itemData.ContentImageName
        backgroundImageView.image = UIImage(named: contentImageName)
        contentImageView.image = UIImage(named: contentImageName)
        
        genreLabel.text = itemData.Genre
        dateLabel.text = itemData.Date
        platformLabel.text = itemData.Platform
    }


}
