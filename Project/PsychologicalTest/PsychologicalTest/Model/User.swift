
import Foundation

//struct User {
//    let username: String
//    var email: String
//    var password: String
//
//    init?(dictionary: [String: Any]) {
//        guard let username = dictionary["userName"] as? String else { return nil }
//        self.username = username
//
//        guard let email = dictionary["email"] as? String else { return nil }
//        self.email = email
//
//        guard let password = dictionary["password"] as? String else { return nil }
//        self.password = password
//    }
//
//}
//
//
//struct Users {
//    var users: [User] = []
//
//    init?(dictionary: [String: Any]) {
//        guard let users = dictionary["users"] as? [[String: Any]] else { return nil }
//
//        for user in users {
//            self.users.append(User(dictionary:user)!)
//        }
//
//    }
//
//}

struct User:Codable {
    let username: String
    var email: String
    var password: String
}


struct Users: Codable {
    var users: [User]

}

