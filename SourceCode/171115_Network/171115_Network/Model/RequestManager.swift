
import Foundation
import UIKit

class RequestManager {
    let mainURL = "http://api.openweathermap.org/data/2.5/weather"
    let APIKey = "89e4a79cf2b99a9f6ac5d5654d83a51b"
    
    static var main = RequestManager()
    
    func requestCity(city: String, compeltion: @escaping (Bool, Data?, Error?) -> Void) {
        let fullURL = mainURL + "?q=\(city)&APPID=" + APIKey
        let url = URL(string: fullURL)
        let request = URLRequest(url: url!)

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                compeltion(false, nil, error)
            }else {
                let response = response as! HTTPURLResponse
                let statusLevel = (response.statusCode / 100) == 2
                
                
//if statusLevel
                
                
                
            }
        }
        
    }
    
}
