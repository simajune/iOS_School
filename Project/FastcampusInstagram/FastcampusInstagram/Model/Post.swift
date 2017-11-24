
import Foundation

struct Post {
    let username: String
    let postPhotoID: String
    let content: String
    let date: Int
 
    init?(key: String, with Dic: [String: Any]) {
        guard let username = Dic["username"] as? String else { return nil }
        self.username = username
        guard let postPhotoID = Dic["postPhotoID"] as? String else { return nil }
        self.postPhotoID = postPhotoID
        guard let content = Dic["content"] as? String else { return nil }
        self.content = content
        guard let date = Dic["date"] as? Int else { return nil }
        self.date = date
    }
}

