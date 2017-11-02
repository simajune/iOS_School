//
//  ViewController.swift
//  CoverFlowTest
//
//  Created by SIMA on 2017. 10. 31..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CoverFlowDelegate {

    var songdata: SongData?
    var indexNumber: IndexPath?
    var cell: CustomCell?
    
    @IBOutlet weak var coverFLow: CoverFlowLayout!
    @IBOutlet weak var lyricAnimatorY: NSLayoutConstraint!
    @IBOutlet weak var lyricView: UIView!
    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songdata = SongData()
        coverFLow.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songdata?.imgList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
        indexNumber = indexPath
        self.cell!.cellImage.image = songdata?.imgList[indexPath.item]
        self.cell!.cellTextView.text = songdata?.lyric[indexPath.item]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.size.width * 0.4, height: collectionView.frame.size.height * 0.6)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInset = UIEdgeInsetsMake(0, collectionView.frame.size.width * 0.3, 0, collectionView.frame.size.width * 0.2)
        
        return edgeInset
    }
    
    func textViewScale(_ coverFlow: CoverFlowLayout, attribute: UICollectionViewLayoutAttributes) {
        UIView.animate(withDuration: 2.0) {
            if coverFlow.attri < 1.3 {
                //cell?.cellTextView.isHidden = true
                self.cell?.cellTextView.frame = CGRect(x: 0, y: (self.cell?.cellImage.frame.maxY)!, width: 0, height: 0)
            }else {
                //cell?.cellTextView.isHidden = false
                self.cell?.cellTextView.frame = CGRect(x: 0, y: (self.cell?.cellImage.frame.maxY)!, width: (self.cell?.frame.width)!, height: (self.cell?.frame.height)! - (self.cell?.cellImage.frame.size.height)!)
            }
            self.view.layoutIfNeeded()
        }
    }
        
    
    
    
}

extension ViewController: UIScrollViewDelegate {
    
}

