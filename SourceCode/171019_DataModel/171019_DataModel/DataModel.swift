
import Foundation

//enum Gender: Int {
//    case male = 1
//    case female = 2
//}
//
//struct UserModel {
//    var userID: String
//    var userPW: String
//    var userEmail: String
//    var birthday: String?
//    var gender: Gender?
//
//    var dictionary: [String: Any]{
//
//        var returnDic: [String: Any] = ["userID": self.userID, "userPW": self.userPW]
//
//        if let birthDayValue = self.birthday {
//            returnDic.updateValue(birthDayValue, forKey: "birthday")
//        }
//
//        if let genderStr = self.gender?.rawValue {
//            returnDic.updateValue(genderStr, forKey: "gender")
//        }
//
//        return returnDic
//    }
//
//    init?(dataDic: [String: Any]) {
//        guard let userID = dataDic["userID"] as? String else { return nil }
//        self.userID = userID
//
//        guard let userPW = dataDic["userPW"] as? String else { return nil }
//        self.userPW = userPW
//
//        guard let userEmail = dataDic["userEmail"] as? String else { return nil }
//        self.userEmail = userEmail
//
//        self.birthday = dataDic["birthday"] as? String
//
//        if let rawData = dataDic["gender"] as? Int, (rawData == 1 || rawData == 2) {
//            self.gender = Gender(rawValue: rawData)
//        }
//    }
//
//}

//var exhibition:[String: Any] = [:]
//var imageURL: [String] = []
//var exhibitName1: [String] = []
//var place: [String] = []
//var startDate: [String] = []
//var endDate: [String] = []
//
//
//
//struct Exhibition {
//    var imageURL: String?
//    var exhibitName: String
//    var place: String?
//    var startDate: Date
//    var endDate: String
//
//    init?(dataDic: [String: String]) {
//
//
//        self.imageURL = dataDic["imageURL"]
//
//        guard let exhibitName = dataDic["exhibitName"] else { return nil }
//        self.exhibitName = exhibitName
//
//        self.place = dataDic["place"]
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy.MM.dd"
//        guard let startDateStr = dataDic["startDate"] else { return nil }
//        self.startDate = formatter.date(from: startDateStr)!
//
//        guard let endDate = dataDic["endDate"] else { return nil }
//        self.endDate = endDate
//    }
//}
////////////////////////////////////////////////////////////////////////////////////////////

struct AlbumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(albumInfo: [String: Any]) {
        
        guard let albumTitle = albumInfo["albumTitle"] as? String else { return nil }
        self.albumTitle = albumTitle
        
        guard let artist = albumInfo["artist"] as? String else { return nil }
        self.artist = artist
        
        guard let genre = albumInfo["genre"] as? String else { return nil }
        self.genre = genre
        
    }
}

struct SongData {
    var songTitle: String
    var trackNum: Int
    var artist: String
    var writer: String
    var playTime: Int
    var playURL: String
    
    var formatter: DateFormatter = DateFormatter()
    
    //    var playTime: Int = 0{
    //        willSet{
    //            let now = Date(timeIntervalSince1970: TimeInterval(newValue))
    //            formatter.dateFormat = "mm:ss"
    //            self.totalPlayTime = formatter.string(from: now)
    //        }
    //
    //    }
    var totalPlayTime: String = "00:00"
    
    init?(songData: [String: Any]) {
        guard let songTitle = songData["songTitle"] as? String else { return nil }
        self.songTitle = songTitle
        
        guard let trackNum = songData["trackNum"] as? Int else { return nil }
        self.trackNum = trackNum
        
        guard let artist = songData["artist"] as? String else { return nil }
        self.artist = artist
        
        guard let writer = songData["writer"] as? String else { return nil }
        self.writer = writer
        
        guard let playTime = songData["playTime"] as? Int else { return nil }
        self.playTime = playTime
        
        guard let playURL = songData["playURL"] as? String else { return nil }
        self.playURL = playURL
    }
}


struct AlbumModel {
    var albumInfo: AlbumInfo
    var songList: [SongData] = []
    
    init?(albumModel: [String: Any]) {
        guard let albumInfo = albumModel["albumInfo"] as? [String:Any] else { return nil }
        self.albumInfo = AlbumInfo(albumInfo: albumInfo)!
        
        guard let list = albumModel["songList"] as? [[String: Any]] else { return nil }
        for index in list{
            self.songList.append(SongData(songData: index)!)
        }
    }
}

////////////////////////////////////////////////
/*{
 - playlists: array of playlist
 - id: 3
 - upid: nil
 - title: “나의 노래”
 - main_img_url: “http://naver.com”
 - thumb_img_url: “http://naver.com”
 - song_cnt: 3
 - is_premium: “N”
 - monthly_ym: 201705
 - like_info: 좋아요 정보
 - song: object key for song.
 - id: 321
 - like_cnt
 - is_like: “N”
 - up: object key for user playlist.
 - id: nil
 - like_cnt : nil
 - is_like: “N”
 - artist: object key for artist.
 - id: 103
 - like_cnt : 1022
 - is_like: “Y”
 }*/
/////////////////////////////////////////////////
//
//let playModel =
//    ["playList":["id": 3, "upid": nil, "title": "나의 노래", ""]]


//struct PlayList {
//    var id: Int?
//    var upid: String?
//    var title: String
//    var mainImgURL: String
//    var thumbImgURL: String
//    var songCnt: Int
//    var isPremium: Bool
//    var monthlyYM: Date
//
//    let datefomatter: DateFormatter = DateFormatter()
//
//    init? (dataDic: [String: Any]) {
//        //        guard let id = dataDic["id"] as? Int else { return nil }
//        //        self.id = id
//        //
//        //        guard let upid = dataDic["upid"] as? String else { return nil }
//        //        self.upid = upid
//
//        if let id = dataDic["id"] as? Int {
//
//            self.id = id
//            self.upid = dataDic["upid"] as? String
//        }else {
//            if let upid = dataDic["upid"] as? String {
//                self.id = dataDic["id"] as? Int
//                self.upid = upid
//            }else {
//                return nil
//            }
//        }
//        guard let title = dataDic["title"] as? String else { return nil }
//        self.title = title
//
//        guard let mainImgURL = dataDic["mainImgURL"] as? String else { return nil }
//        self.mainImgURL = mainImgURL
//
//        guard let thumbImgURL = dataDic["thumbImgURL"] as? String else { return nil }
//        self.thumbImgURL = thumbImgURL
//
//        guard let songCnt = dataDic["songCnt"] as? Int else { return nil }
//        self.songCnt = songCnt
//
//        if let isPremium = dataDic["isPremium"] as? String, (isPremium == "Y" || isPremium == "N"){
//            self.isPremium = isPremium == "Y" ? true:false
//        } else { return nil }
//
//        guard let monthlyYM = dataDic["monthlyYM"] as? Date else { return nil }
//        datefomatter.dateFormat = "yyyyMM"
//        datefomatter.string(from: monthlyYM)
//        self.monthlyYM = monthlyYM
//    }
//}
//
//enum LikeType {
//    case song
//    case up
//    case artist
//}
//
//struct LikeInfo {
//    var type: LikeType?
//    var likeCnt: Int?
//    var isLike: Bool?
//
//    init?(likeInfo: [String: Any]) {
//        if let _ = likeInfo["song"] as? String {
//            self.type = .song
//            self.likeCnt = (likeInfo["likeInfo"] as? Int)!
//            if let isLike = likeInfo["isLike"] as? String, (isLike == "Y" || isLike == "N") {
//                self.isLike = isLike == "Y" ? true:false
//            }
//        }else {
//            if let _ = likeInfo["up"] as? String {
//                self.type = .up
//                self.likeCnt = (likeInfo["likeInfo"] as? Int)!
//                if let isLike = likeInfo["isLike"] as? String, (isLike == "Y" || isLike == "N") {
//                    self.isLike = isLike == "Y" ? true:false
//                }
//            }else {
//                if let _ = likeInfo["artist"] as? String {
//                    self.type = .artist
//                    self.likeCnt = (likeInfo["likeInfo"] as? Int)!
//                    if let isLike = likeInfo["isLike"] as? String, (isLike == "Y" || isLike == "N") {
//                        self.isLike = isLike == "Y" ? true:false
//                    }
//                }else {
//                    self.type = nil
//                    self.likeCnt = nil
//                    self.isLike = nil
//                }
//            }
//        }
//
//    }
//
//}










