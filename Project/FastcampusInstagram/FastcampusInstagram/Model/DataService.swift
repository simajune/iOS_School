
import Foundation
import UIKit
import Firebase

class InstaDatabase {
    
    let uid = Auth.auth().currentUser?.uid
    var ref = Database.database().reference()
    static var main: InstaDatabase = InstaDatabase()
    
    var username: String?
    var profilePhotoID: String?
    var posts: [Post] = []
    
    private init() {
//        loadPostData()
//        loadUserData()
    }
    
    func loadUserData() {
        print(uid)
        ref.child("users").child(uid!).observe(.value) { (snapshot) in
            
            print(snapshot.value)
            if let value = snapshot.value as? [String: Any] {
                DispatchQueue.main.async {
                    guard let username = value["username"] as? String else { return }
                    self.username = username
                    guard let profilePhotoID = value["profilePhotoID"] as? String else { return }
                    self.profilePhotoID = profilePhotoID
                    NotificationCenter.default.post(name: .myNotification, object: self)
                }
            }
        }
    }
    
    func loadPostData() {
        ref.child("posts").observe(.value) { (snapshot) in
            if let value = snapshot.value as? [String: Any] {
                self.posts.insert(Post(with: value)! , at: 0)
                
            }
        }
    }
    
    func savePostData(username: String, content: String, postPhotoID: String) {
        ref.child("posts").childByAutoId().setValue(["username": username, "content": content, "postPhotoID": postPhotoID, "date": ServerValue.timestamp()] )
    }
    
    func saveUserData(username: String, userProfilephotoID: String) {
        ref.child("users").child(uid!).setValue(["username": username, "profilePhotoID": userProfilephotoID])
    }
    
    func saveProfilePhotoIDStorage() {
        
    }
    
    func savepostPhotoIDStorage() {
        
    }
    
}
