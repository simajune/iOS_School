
import Foundation

struct MemberData {
    var phoneNumber: String
    var profileImage: String
    var myProfileDescription: String
    var backgroundImage: String
    var nickname: String
    var email: String
    
    init?(memberData: [String: String]) {
        guard let phoneNumber = memberData["PhoneNumber"] else { return nil }
        self.phoneNumber = phoneNumber
        
        guard let profileImage = memberData["ProfileImage"] else { return nil }
        self.profileImage = profileImage
        
        guard let myProfileDescription = memberData["MyProfileDescription"] else { return nil }
        self.myProfileDescription = myProfileDescription
        
        guard let backgroundImage = memberData["BackgroundImage"] else { return nil }
        self.backgroundImage = backgroundImage
        
        guard let nickname = memberData["Nickname"] else { return nil }
        self.nickname = nickname
        
        guard let email = memberData["Email"] else { return nil }
        self.email = email
    }
    
}
