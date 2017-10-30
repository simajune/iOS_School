
import Foundation

enum CellType: String {
    case settingDetailCell = "SettingDetailCell"
    case settingBasicCell = "SettingBasicCell"
    case settingSwitchCell = "SettingSwitchCell"
    case settingNonButtonCell = "SettingNonButtonCell"
}

struct DataCell {
    var cellStyle: CellType
    var content: String
    
    init?(cellDoc: [String: String]){
        guard let cellStyle = cellDoc["CellStyle"] else { return nil }
        self.cellStyle = CellType(rawValue: cellStyle)!
        
        guard let content = cellDoc["Content"] else { return nil }
        self.content = content
    }
}

struct SettingData {
    var sectionTitle: String
    var datas: [DataCell] = []
    
    
    init?(settingData: [String: Any]) {
        guard let sectionTitle = settingData["SectionTitle"] as? String else{ return nil }
        self.sectionTitle = sectionTitle
        
        guard let datas = settingData["Data"] as? [[String: String]] else { return nil }
        for index in datas {
            if let data = DataCell(cellDoc: index) {
                self.datas.append(data)
            }
        }
    }
}
