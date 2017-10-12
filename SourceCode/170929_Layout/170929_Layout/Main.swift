//
//  ViewController.swift
//  170929_Layout
//
//  Created by SIMA on 2017. 9. 29..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class Main: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

//MARK: - Variable
    var itemGroupSetData = [ItemGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemGroupSetData = ItemGroup().AddItem()
        
    }
    //MARK: - CollectioView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroupSetData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 1{
            return CGSize(width: view.frame.size.width, height: 140)

        }
        return CGSize(width: view.frame.size.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1{
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "CellB", for: indexPath) as! CellB
            cellB.itemGroupData = itemGroupSetData[indexPath.row]
            cellB.itemGroupTitleLabel.text = itemGroupSetData[indexPath.row].ItemGroupTitleLabel
            cellB.itemGroupIndex = indexPath.row
            
            return cellB
        }
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "CellA", for: indexPath) as! CellA
        cellA.itemGroupData = itemGroupSetData[indexPath.row]
        cellA.itemGroupTitleLabel.text = itemGroupSetData[indexPath.row].ItemGroupTitleLabel
        cellA.itemGroupIndex = indexPath.row

        return cellA
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            }
    
    //CollectioView End

}

