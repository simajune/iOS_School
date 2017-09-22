//
//  Computer.swift
//  BaseballGame
//
//  Created by SIMA on 2017. 9. 21..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Computer {
    
    //MARK: - Property
    var ansArr: [String] = []
    
    //MARK: - Method
    //랜덤수 생성하는 함수
    func generateAnswer() -> [String] {
        var randomNum : String
        ansArr = []
        while ansArr.count < 3 {
            randomNum = String(arc4random_uniform(10))
            
            if !ansArr.contains(randomNum) {
                ansArr.append(randomNum)
            }
        }
        return ansArr
    }
    
}
