
import Foundation

let baseURL = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"

let urllogin = "/member/login/"
let urlSignup = "/member/signup/"

class NetworkManager {
    static var shared: NetworkManager = NetworkManager()
    
    typealias completion = (_ isSuccess: Bool, _ returnValue: Any?, _ error: Error?) -> Void
    
    var token:String?
    
    let session = URLSession.shared
    
    private init() {
        loadToken()
    }
    
    func requestSignup(userid: String, pw: String, repw: String completion: @escaping completion) {
        let url = URL(string: baseURL + urlSignup)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let dataStr = "username=\(userid)&password1=\(pw)&password2=\(repw)"
        request.httpBody = dataStr.data(using: .utf8)
        
        session.dataTask(with: request) { [unowned self] (data, response, error) in
            
            
            let code = (response as! HTTPURLResponse).statusCode
            
            if code == 201 {
                
                let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
                
                self.token = resultDic["key"]
                completion(true, nil, nil)
            }else {
//                let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
//                if let data = resultDic["username"] as? NSArray {
////                    print(data)
//                    print(data[0] as! String)
//                }
                completion(false, nil, nil)
            }
        }.resume()
    }
    
    func requestLogin (userID: String, userpw: String, completion: @escaping completion) {
        let url = URL(string: baseURL + urllogin)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let dataStr = "username=\(userID)&password=\(userpw)"
        request.httpBody = dataStr.data(using: .utf8)
        
        session.dataTask(with: request) { [unowned self](data, response, error) in
            let code = (response as! HTTPURLResponse).statusCode
            
            if code == 200 {
                let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
                self.token = resultDic["key"]
                completion(true, nil, nil)
            }else {
                //let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                completion(false, nil, nil)
            }
        }.resume()
        
    }
    
    func saveToken() {
        if let token = token {
            UserDefaults.standard.set(token, forKey: "TokenKey")
        }
    }
    
    func loadToken() {
        if let token = UserDefaults.standard.string(forKey: "TokenKey") {
            self.token = token
        }
    }
    
}
