
import Foundation

class DataCenter {
    
    static  var mainCenter: DataCenter = DataCenter()
    
    var nameList: [String] = []
    
    private init() {
        loadNameList()
    }
    
    func loadNameList() {
        //plist에서 데이터를 불러와서 nameList에 저장
        let docArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/NameList.plist"
        print(docArray)
        
        if !FileManager.default.fileExists(atPath: docArray) {
            if let bundleArray = Bundle.main.path(forResource: "NameList", ofType: "plist") {
                do{
                    try FileManager.default.copyItem(atPath: bundleArray, toPath: docArray)
                }catch {
                    print(error)
                }
            }
        }
        
        //plist에 가져온 데이터를 배열에 저장
        guard let names = NSArray(contentsOfFile: docArray) as? [String] else { return }
        self.nameList = names
    }
    
    func addName(_ name: String) {
        //nameList에 추가
        self.nameList.insert(name, at: 0)
        saveNameList()
    }
    
    func saveNameList() {
        //plist에 저장
        let docArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/NameList.plist"
        
        NSArray(array: nameList).write(toFile: docArray, atomically: true)

        
    }
    
}
