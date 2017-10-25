
import Foundation

class DataCenter {
    
    private var members: [MemberData] = []
    var membersData:[MemberData] {
        return members
    }
 
    private var privateSettings: [SettingData] = []
    var settings: [SettingData] {
        return privateSettings
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
        
        if let bundleArray = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingsArray = NSArray(contentsOfFile: bundleArray) as? [Any] {
            for list in settingsArray {
                if let settinglist = list as? [String: Any],
                    let privateSettings = SettingData(settingData: settinglist) {
                    self.privateSettings.append(privateSettings)
                }
            }
        }
    }
    
    func addName(_ name: String) {
        
    }
    
    func saveData() {
        
    }
    
}
