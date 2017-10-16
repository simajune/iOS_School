//
//  DataModel.swift
//  171016_DataModel
//
//  Created by SIMA on 2017. 10. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

enum Gender: Int {
    case male = 1
    case female = 2
}

struct UserModel {
    var userID: String
    var userPW: String
    var userEmail: String
    var birthday: String?
    var gender: Gender?

    init?(dataDic: [String: Any]) {
        guard let userID = dataDic["userID"] as? String else { return nil }
        self.userID = userID

        guard let userPW = dataDic["userPW"] as? String else { return nil }
        self.userPW = userPW

        guard let userEmail = dataDic["userEmail"] as? String else { return nil }
        self.userEmail = userEmail

        self.birthday = dataDic["birthday"] as? String

        if let rawData = dataDic["gender"] as? Int, (rawData == 1 || rawData == 2) {
            self.gender = Gender(rawValue: rawData)
        }
    }

}

//let exhibition:[String: Any] = ["imageURL" : "http://...",
//                                "exhibitName": "ALICE",
//                                "place": "SeoulForest",
//                                "startDate": "2017/08/08",
//                                "endDate": "2018/03/01"]

var exhibition:[String: Any] = [:]
var imageURL: [String] = []
var exhibitName1: [String] = []
var place: [String] = []
var startDate: [String] = []
var endDate: [String] = []



struct Exhibition {
    var imageURL: String?
    var exhibitName: String
    var place: String?
    var startDate: Date
    var endDate: String
    
    init?(dataDic: [String: String]) {
        

        self.imageURL = dataDic["imageURL"]
        
        guard let exhibitName = dataDic["exhibitName"] else { return nil }
        self.exhibitName = exhibitName
        
        self.place = dataDic["place"]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        guard let startDateStr = dataDic["startDate"] else { return nil }
        self.startDate = formatter.date(from: startDateStr)!
        
        guard let endDate = dataDic["endDate"] else { return nil }
        self.endDate = endDate
    }
}



















