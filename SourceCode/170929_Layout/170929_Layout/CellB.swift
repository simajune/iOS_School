//
//  CellB.swift
//  170929_Layout
//
//  Created by SIMA on 2017. 9. 30..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class CellB: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//MARK: - Variable
    @IBOutlet var itemGroupTitleLabel: UILabel!
    var itemGroupData = ItemGroup()
    var itemGroupIndex = Int()
    
//MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroupData.ItemSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width - 40) / 3, height: 99)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCellB = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellB", for: indexPath) as! ItemCellB
        let itemImageName = itemGroupData.ItemSet[indexPath.row].ItemImageName
        itemCellB.itemImage.image = UIImage(named: itemImageName)
        itemCellB.itemImage.layer.cornerRadius = 10
        itemCellB.itemImage.layer.masksToBounds = true
        
        itemCellB.itemTitleLabel.text = itemGroupData.ItemSet[indexPath.row].ItemImageName
        return itemCellB
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSDefault.set(itemGroupIndex, forKey: "ItemGroupIndex")
        NSDefault.set(indexPath.row, forKey: "ItemIndex")

        print(indexPath.row)
    }
    
//End Collection View
}
