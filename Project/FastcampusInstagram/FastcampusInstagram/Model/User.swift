
import Foundation

struct User {
    let user: String
    let profilePhotoID: String
    
    init?(with Dic: [String: Any]) {
        guard let user = Dic["user"] as? String else { return nil }
        self.user = user
        guard let profilePhotoID = Dic["profilePhotoID"] as? String else { return nil }
        self.profilePhotoID = profilePhotoID
        
    }
}

