
import Foundation
import AVFoundation
import UIKit

class SongData {
    var songTitle : [String] = []
    var artist : [String] = []
    var imgList: [UIImage] = []
    
    
    init? () {
        loadImageData()
    }
    
    
    
    func loadImageData() {
        for index in 0 ... 29 {
            if let url = Bundle.main.url(forResource: "Song/\(index)", withExtension: "mp3") {
                let asset = AVURLAsset(url: url)
                let metaData: [AVMetadataItem] = asset.metadata
                
                
                for item in metaData {
                    if let key = item.commonKey?.rawValue {
                        switch key {
                        case "title" :
                            //self.songTitle = (item.value as? String)!
                            self.songTitle.append((item.value as? String)!)
                        case "artist" :
                            //self.artist = (item.value as? String)!
                            self.artist.append((item.value as? String)!)
                        case "artwork" :
                            if let data = item.dataValue {
                                self.imgList.append(UIImage(data: data)!)
                            }
                        default :
                            print("없음")
                        }
                        
                    }
                }
            }
        }
    }
}

//extension MusicCollectionViewCell: UIScrollViewDelegate {
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let pageIndex = Int(targetContentOffset.pointee.x/scrollView.bounds.size.width)
//
//    }
//}

