
import Foundation

//struct UserService {
//
//    var model: Users?
//
//    var documentDirectory: URL {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    }
//
//    static var sharedInstance: UserService = UserService()
//
//    init() {
//        //pList에서 정보를 가져와서 model에 넣는다.
//
//        loadData()
//    }
//
//    mutating func loadData() {
//        let dataURL = documentDirectory.appendingPathComponent("UserData.plist")
//        let dataStringPath = dataURL.path
//        print(dataStringPath)
//
//        if !FileManager.default.fileExists(atPath: dataStringPath) {
//            guard let plistURL = Bundle.main.url(forResource: "UserData", withExtension: "plist") else { return }
//            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
//
//        }
//
//        guard let dataDictionary = NSDictionary(contentsOf: dataURL) as? [String: Any] else { return }
//        self.model = Users(dictionary: dataDictionary)
//
//    }
//
//    func validateUserInfo(username: String, password: String) -> Bool {
//
//        if let model = self.model {
//
//            for user in model.users {
//                if user.username == username && user.password == password {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//}


struct UserService {

    var model: Users?

    var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    static var sharedInstance: UserService = UserService()

    init() {
        //pList에서 정보를 가져와서 model에 넣는다.
        loadData()
    }

    mutating func loadData() {
        let dataURL = documentDirectory.appendingPathComponent("UserData.plist")
        let dataStringPath = dataURL.path

        if !FileManager.default.fileExists(atPath: dataStringPath) {
            guard let plistURL = Bundle.main.url(forResource: "UserData", withExtension: "plist") else { return }
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
        }

        let propertyDecoder = PropertyListDecoder()
        let data = try! Data(contentsOf: dataURL)
        self.model = try! propertyDecoder.decode(Users.self, from: data)

    }

    func validateUserInfo(username: String, password: String) -> Bool {

        if let model = self.model {

            for user in model.users {
                if user.username == username && user.password == password {
                    return true
                }
            }
        }
        return false
    }
}

