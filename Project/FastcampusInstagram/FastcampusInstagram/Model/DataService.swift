
import Foundation
import UIKit
import Firebase

class InstaDatabase {
    
    let uid = Auth.auth().currentUser?.uid
    var ref = Database.database().reference()
    static var main: InstaDatabase = InstaDatabase()
    
    var username: String?
    var profilePhotoID: String?
    var profilePhotoIDImg: UIImage?
    var posts: [Post] = []
    
    private init() {

    }
    
    func loadUserData() {
        posts = []
        ref.child("users").child(uid!).observe(.value) { (snapshot) in
            print(snapshot.value)
            DispatchQueue.main.async {
                if let value = snapshot.value as? [String: Any] {
                    guard let username = value["username"] as? String else { return }
                    self.username = username
                    guard let profilePhotoID = value["profilePhotoID"] as? String else { return }
                    self.profilePhotoID = profilePhotoID
                    if let urlStr = URL(string: profilePhotoID), let profileImg = try? Data(contentsOf: urlStr) {
                        self.profilePhotoIDImg = UIImage(data: profileImg)
                    }
                    NotificationCenter.default.post(name: .myNotification, object: nil)
                }
            }
        }
    }
    
    func loadPostData() {
        ref.child("posts").observeSingleEvent(of: .value) { (snapshot) in
            DispatchQueue.main.async {
                if let value = snapshot.value as? [String: [String: Any]] {
                    print(value)
                    for (key, postDic) in value {
                        self.posts.insert(Post(key: key, with: postDic)!, at: 0)
                    }
                    NotificationCenter.default.post(name: .myNotification, object: nil)
                }
            }
            
        }
    }
    
    func savePostData(username: String, content: String, postPhotoID: String) {
        ref.child("posts").childByAutoId().setValue(["username": username, "content": content, "postPhotoID": postPhotoID, "date": ServerValue.timestamp()] )
    }
    
    func saveUserData(uid: String, username: String, profilePhotoID: String) {
        ref.child("users").child(uid).setValue(["username": username, "profilePhotoID": profilePhotoID])
    }
    
    func saveProfilePhotoIDStorage() {
        
    }
    
    func savepostPhotoIDStorage() {
        
    }
    
}
