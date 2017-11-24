
import Foundation
import UIKit
import Firebase

class InstaDatabase {
    
    let uid = Auth.auth().currentUser?.uid
    var ref = Database.database().reference()
    static var main: InstaDatabase = InstaDatabase()
    
    var user: String?
    var PhotoID: String?
    var posts: [Post] = []
    
    func loadData() {
        
        ref.child(uid!).observeSingleEvent(of: .value) { (snapshot) in
            if let value = snapshot.value as? [String: Any]{
                print(value)
                DispatchQueue.main.async {
                    guard let user = value["user"] as? String else { return }
                    self.user = user
                    guard let PhotoID = value["photoID"] as? String else { return }
                    self.PhotoID = PhotoID
                    if let posts = value["Posts"] as? [[String: Any]] {
                        for post in posts {
                            self.posts.insert(Post(postsDic: post)!, at: 0)
//                            self.posts = posts
                        }
                    }
                    NotificationCenter.default.post(name: .myNotification, object: nil)
                }
            }
        }
    }
}

struct Post {
//    var date: String
    var photoID: String
    var content: String
    var user: String
    
    init? (postsDic: [String: Any]) {
//        guard let date = postsDic["date"] as? String else { return nil }
//        self.date = date
        guard let photoID = postsDic["images"] as? String else { return nil }
        self.photoID = photoID
        guard let content  = postsDic["content"] as? String else { return nil }
        self.content = content
        guard let user = postsDic["user"] as? String else { return nil }
        self.user = user
    }
    
}

