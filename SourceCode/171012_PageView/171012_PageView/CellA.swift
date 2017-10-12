//
//  CellA.swift
//  170929_Layout
//
//  Created by SIMA on 2017. 9. 30..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CellA: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//MARK: - Variable
    @IBOutlet var itemGroupTitleLabel: UILabel!
    var itemGroupData = ItemGroup()
    var itemGroupIndex = Int()
    var mainViewController = Main()
       
//MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroupData.ItemSet.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width - 30) / 2, height: 199)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCellA = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellA", for: indexPath) as! ItemCellA
        
        let itemImageName = itemGroupData.ItemSet[indexPath.row].ItemImageName
        itemCellA.itemImage.image = UIImage(named: itemImageName)
        itemCellA.itemImage.layer.cornerRadius = 10
        itemCellA.itemImage.layer.masksToBounds = true
        
        itemCellA.itemTitleLabel.text = itemGroupData.ItemSet[indexPath.row].ItemTitleLabel

        return itemCellA
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSDefault.set(itemGroupIndex, forKey: "ItemGroupIndex")
        NSDefault.set(indexPath.row, forKey: "ItemIndex")
        mainViewController.toCover()
        print(indexPath.row)
    }
//End collection view
}
