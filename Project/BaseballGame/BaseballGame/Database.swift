//
//  Database.swift
//  BaseballGame
//
//  Created by SIMA on 2017. 9. 22..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation
class Database {
    
    //MARK : - Property
    var allHistory: String = ""
    var prevHistory: String = ""
    var gameHistory: String = ""
    var currentHistory: String = "" {
        didSet{
            prevHistory = oldValue
        }
        willSet {
            gameHistory += newValue
            allHistory += newValue
        }
    }
    
    //MARK : - Method
    //버튼 눌렀을 때 히스토리 저장
    func afterHistoryText (_ resultText: String?, _ displayNumer: String, _ count: Int, _ strikeNumber: Int, _ running: inout Bool) -> String{
        if strikeNumber == 3 {
            return "\(count)번만에 정답을 맞췄습니다. 정답은 " + displayNumer + "입니다.\n"
        }else {
            return "\(count). " + resultText! + " : " + displayNumer + "\n"
        }
    }
    
}
