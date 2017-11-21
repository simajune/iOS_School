
import Foundation
import UIKit

let baseURL = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"

let urllogin = "/member/login/"
let urlSignup = "/member/signup/"
let urlPost = "/post/"
let urlLogout = "/member/logout/"

class NetworkManager {
    static var shared: NetworkManager = NetworkManager()
    
    typealias completion = (_ isSuccess: Bool, _ returnValue: Any?, _ error: Error?) -> Void
    
    var contents: [PostModel] = []
    var token:String?
    
    let session = URLSession.shared
    
    private init() {
        loadToken()
    }
    
    //MARK: - 회원가입 요청
    func requestSignup(userid: String, pw: String, repw: String, completion: @escaping completion) {
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
    
    //MARK: - 로그인 요청
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
    
    //MARK: - 포스팅
    func requestPosts(post: PostModel, img: UIImage, completion: @escaping completion) {
        let url = URL(string: baseURL + urlPost)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        guard let token = NetworkManager.shared.token else { return }
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let filename = String(Date().timeIntervalSince1970) + ".jpeg"
        
        let body = createBody(parameters: post.param,
                             boundary: boundary,
                             data: UIImageJPEGRepresentation(img, 0.5)!,
                             dataType: "img_cover",
                             mimeType: "image/jpeg",
                             filename: filename)
        request.httpBody = body
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(false, nil, error)
                
            }else {
                
                let code = (response as! HTTPURLResponse).statusCode
                print(code)
                if code == 201 {
                    completion(true, nil, nil)
                }else {
                    completion(false, nil, nil)
                }
            }
        }.resume()
    }
    
    //MARK: - 포스트 요청
    func requestGetPosts(completion:@escaping completion) {
        let url = URL(string: baseURL + urlPost)
        var request = URLRequest(url: url!)
        guard let token = NetworkManager.shared.token else { return }
        
        request.httpMethod = "GET"
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(false, nil, error)
            }else {
                let code = (response as! HTTPURLResponse).statusCode
                if code == 200 {
                    let decoder = JSONDecoder()
                    let model = try! decoder.decode([PostModel].self, from: data!)
                    completion(true, model, nil)
                }
            }
        }.resume()
    }
    
    //MARK: - 로그아웃 요청
    func requestLogout(completion: @escaping completion) {
        //url 지정
        let url = URL(string: baseURL + urlLogout)
        //request 설정
        var reqeust = URLRequest(url: url!)
        reqeust.httpMethod = "POST"
        guard let token = NetworkManager.shared.token else { return }
        
        reqeust.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: reqeust) { (data, response, error) in
            
            if error != nil {
                print(error)
                completion(false, nil, error)
            }else {
                let code = (response as! HTTPURLResponse).statusCode
                if code == 201 {
                    completion(true, nil, nil)
                }else {
                    completion(false, nil, nil)
                }
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
    
    ///////////////////////////////////////////////////
    private func createBody(parameters: [String: String],
                            boundary: String,
                            data: Data,
                            dataType:String,
                            mimeType: String,
                            filename: String) -> Data {

        var body = Data()
        let boundaryPrefix = "--\(boundary)\r\n"
        for (key, value) in parameters {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(dataType)\"; filename=\"\(filename)\"")
        body.appendString("\r\n")
        body.appendString("Content-Type: \(mimeType)")
        body.appendString("\r\n")
        body.appendString("\r\n")
        body.append(data)
        body.appendString("\r\n")

        body.appendString("--\(boundary)--")
        return body
    }
    
//    private func createBody(parameters: [String: String],
//                           boundary: String,
//                           data: Data,
//                           dataType: String,
//                           mimeType: String,
//                           filename: String) -> Data {
//        var body = Data()
//        let boundaryPrefix = "--\(boundary)\r\n"
//        for (key, value) in parameters {
//            body.appendString(boundaryPrefix)
//            body.appendString("Content-Disposition: form-data; name=\"\(key)\"")
//            body.appendString("\r\n")
//            body.appendString("\r\n")
//            body.appendString("\(value)")
//            body.appendString("\r\n")
//        }
//        body.appendString(boundaryPrefix)
//        body.appendString("Content-Disposition: form-data; name=\"\(dataType)\"; filename:\"\(filename)\"")
//        body.appendString("\r\n")
//        body.appendString("Content-Type: \(mimeType)")
//        body.appendString("\r\n")
//        body.appendString("\r\n")
//        body.append(data)
//        body.appendString("\r\n")
//
//        body.appendString("--\(boundary)--")
//
//        return body
//    }
}

extension Data {
    mutating func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion:  false)
        append(data!)
    }
}
