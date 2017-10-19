
import Foundation

//class DataCenter {
//    static var main: DataCenter = DataCenter()
//    var currentUser: UserModel?
//
//    private init() {
//        loadUserData()
//    }
//
//    func loadUserData() {
//        //path
//        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
//
//        //파일이 무조건 존재
//        guard let dic = NSDictionary(contentsOfFile: docPath) as? [String: Any] else { return }
//            currentUser = UserModel(dataDic: dic)
//    }

//    func write(userData data: UserModel) {
//        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
//
//        if !FileManager.default.fileExists(atPath: docPath) {
//            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist"){
//                do {
//                    try FileManager.default.copyItem(atPath: bundlePath, toPath: docPath)
//                }catch {
//                    print(error)
//                }
//            }
//        }
//
//        if let dic = NSDictionary(contentsOfFile: docPath) as? [String:Any] {
//            var dictionary = dic
//
//            dictionary.updateValue("tae", forKey: "user_id")
//            dictionary.updateValue("1234", forKey: "pw")
//            dictionary.updateValue("19870507", forKey: "birthday")
//
//            let nsDic = NSDictionary(dictionary: dictionary)
//            nsDic.write(toFile: docPath, atomically: true)
//        }
//    }
    
    
//    func write (data: UserModel) {
//        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
//
//        if !FileManager.default.fileExists(atPath: docPath) {
//            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist") {
//                do {
//                try FileManager.default.copyItem(atPath: bundlePath, toPath: docPath)
//                } catch {
//                    print("파일 에러")
//                }
//            }
//        }
//
//        if let dic = NSDictionary(contentsOfFile: docPath) as? [String: Any] {
//            var dictionary = dic
//            dictionary.updateValue("sima", forKey: "user_id")
//            dictionary.updateValue("1234", forKey: "pw")
//            dictionary.updateValue("19870507", forKey: "birthday")
//
//            let nsDic = NSDictionary(dictionary: dictionary)
//            nsDic.write(toFile: docPath, atomically: true)
//
//        }
//
//
//
//    }
//}


