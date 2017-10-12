//
//  Content.swift
//  170929_Layout
//
//  Created by SIMA on 2017. 9. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class Cover: UIViewController {

//MARK: - Variable
    var itemGroupIndex = Int()
    var itemIndex = Int()
    
    var itemGroupSetData = [ItemGroup]()
    var itemGroupData = ItemGroup()
    var itemData = Item()
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var platformLabel: UILabel!
    
    var contentImageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Data
        
        
        
        guard let itemGroupIndex = NSDefault.object(forKey: "ItemGroupIndex") as? Int else { return }
        itemIndex = NSDefault.object(forKey: "ItemIndex") as! Int
        
        itemGroupSetData = ItemGroup().AddItem()
        itemGroupData = itemGroupSetData[itemGroupIndex]
        itemData = itemGroupData.ItemSet[itemIndex]
        
        contentImageName = itemData.ContentImageName
        backgroundImageView.image = UIImage(named: contentImageName)
        
        genreLabel.text = itemData.Genre
        dateLabel.text = itemData.Date
        platformLabel.text = itemData.Platform
        
        //Gesture//
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.toConnection))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        
        view.addGestureRecognizer(leftSwipe)
        
        
    }

    //MARK: - Action
    @objc func toConnection() {
        
        NSDefault.set(contentImageName, forKey: "ConnectioBackGroundImageName")
        performSegue(withIdentifier: "toConnection", sender: self)
    }
    //Action End

}
