//
//  MusicPlayerViewController.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    var currentIndex = 0{
        willSet{
            let selectedTitle = songData?.songTitle[newValue]
            let selectedArtist = songData?.artist[newValue]
            self.songTitle.text = selectedTitle
            self.artist.text = selectedArtist
        }
    }
//    var imgList: [UIImage] = []
    var songData: SongData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songData = SongData()
        let selectedTitle = songData?.songTitle[currentIndex]
        let selectedArtist = songData?.artist[currentIndex]
        self.songTitle.text = selectedTitle
        self.artist.text = selectedArtist
        musicCollectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    
//    func loadImageData() {
//        if let url = Bundle.main.url(forResource: "Song/25", withExtension: "mp3") {
//            let asset = AVURLAsset(url: url)
//            let metaData: [AVMetadataItem] = asset.metadata
//
//
//            for item in metaData {
//                //print(item)
//                if let key = item.commonKey?.rawValue {
//                    switch key {
//                    case "title" :
//                        songTitle.text = item.value as? String
//                    case "artist" :
//                        artist.text = item.value as? String
//                    case "artwork" :
//                        if let data = item.dataValue {
//                            imgList.append(UIImage(data: data)!)
//                        }
//                    default :
//                        print("없음")
//                    }
//                }
//            }
//        }
//    }
    
    @IBAction func nextSongAction(_ sender: UIButton) {
    }
    
    @IBAction func prevSongAction(_ sender: UIButton) {
    }
    
}

extension MusicPlayerViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(imgList.count)
        return songData?.imgList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
//        songTitle.text = songData?.songTitle[indexPath.item]
//        artist.text = songData?.artist[indexPath.item]
        cell.imgView.image = songData?.imgList[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.width * 0.6) / 2
        
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.6, height: collectionView.frame.width * 0.6)
//        print(collectionView.frame.width * 0.6)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return collectionView.frame.width * 0.2
//    }
//
}

extension MusicPlayerViewController:UIScrollViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageIndex = Int(targetContentOffset.pointee.x/(scrollView.bounds.size.width * 0.6 + 25))
        currentIndex = pageIndex
    }
}


