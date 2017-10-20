
import Foundation

class DataCenter {
    
    private var members: [MemberData] = []
    var membersData:[MemberData] {
        return members
    }

    init() {
        loadData()
    }
    
    func loadData() {
        
        if let bundleArray = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"),
            let memberArray = NSArray(contentsOfFile: bundleArray) as? [Any] {
            for list in memberArray {
                if let data = list as? [String: String],
                    let memberData = MemberData(memberData: data) {
                    members.append(memberData)
                }
            }
        }
    }
    
    func addName(_ name: String) {
        
    }
    
    func saveData() {
        
    }
    
}
