
import Foundation

class GirlGroupDataCenter {
    
    
    var Nickname: [String] = []
    var ProfileImage: [String] = []
    var MyProfileDescription: [String] = []
    
    var membersArray: [[String: String]] = [[:]]
    
    static var mainCenter: GirlGroupDataCenter = GirlGroupDataCenter()
    
    
    private init() {
        loadData()
    }
    
    func loadData() {
        let docArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/FreindInfo.plist"
        
        if !FileManager.default.fileExists(atPath: docArray) {
            if let bundleArray = Bundle.main.path(forResource: "FreindInfo", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundleArray, toPath: docArray)
                }catch {
                    print(error)
                }
            }
        }
        
        guard let members = NSArray(contentsOfFile: docArray) as? [[String: String]] else { return }
        self.membersArray = members
        for member in membersArray {
            Nickname.append(member["Nickname"]!)
            ProfileImage.append(member["ProfileImage"]!)
            MyProfileDescription.append(member["MyProfileDescription"]!)
            print(member["MyProfileDescription"]!)
        }
    }
    
    func addMember(_ member: [String: String]) {
        self.membersArray.insert(member, at: 0)
        saveMember()
    }
    
    func saveMember() {
        let docArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/FriendInfo.plist"
        NSArray(array: membersArray).write(toFile: docArray, atomically: true)
    }
    
    
}
