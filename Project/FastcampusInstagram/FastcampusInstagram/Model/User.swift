
import Foundation

struct User {
    let user: String
    let userProfilephotoID: String
    
    init?(with Dic: [String: Any]) {
        guard let user = Dic["user"] as? String else { return nil }
        self.user = user
        guard let userProfilephotoID = Dic["userProfilephotoID"] as? String else { return nil }
        self.userProfilephotoID = userProfilephotoID
        
    }
}

