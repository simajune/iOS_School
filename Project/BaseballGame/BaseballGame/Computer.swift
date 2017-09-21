//
//  Computer.swift
//  BaseballGame
//
//  Created by SIMA on 2017. 9. 21..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Computer {
    private var ansArr: [String] = []
    private var count: Int = 0
    private var strikeCount: Int = 0
    private var ballCount: Int = 0
    private var displayNum: String = ""
    
    //MARK: - Instance Method
    
    //랜덤수 생성하는 함수
    func generateRandom() -> [String] {
        var randomIndex : String
        ansArr = []
        while ansArr.count < 3 {
            randomIndex = String(arc4random_uniform(10))
            
            if !ansArr.contains(randomIndex) {
                ansArr.append(randomIndex)
            }
        }
        return ansArr
    }
    //버튼 눌렀을 때 히스토리 저장
    func afterConfirmHistoryText (_ resultText: String?, _ displayNumer: String, _ count: Int, _ strikeNumber: Int, _ running: inout Bool) -> String{
        if strikeNumber == 3 {
            return "\(count)번만에 정답을 맞췄습니다. 정답은" + displayNumer + "입니다."
        }else {
            return "\(count). " + resultText! + " : " + displayNumer + "\n"
        }
    }
    //버튼 눌렀을 때 결과 값 출력
    func afterConfirmResultText (_ ballNumber: Int, _ strikeNumber: Int) -> String {
        if strikeNumber == 3 {
            return "정답!! 짝짝짝"
        }else {
            return "\(strikeNumber)S \(ballNumber)B \(3 - (strikeNumber + ballNumber))O"
        }
    }
    //지우기 버튼을 눌렀을 때 마지막 자리에 nil값이 들어있는지 확인 후, 없을 경우 앞에 자리를 확인하며 값이 있는 경우 nil값으로 바꿈
    public func removeLb(running: Bool, firstText: inout String?, secondText: inout String?, thirdText: inout String?) {
        if running {
            if thirdText != nil {
                thirdText = nil
            }else if secondText != nil {
                secondText = nil
            }else {
                firstText = nil
            }
        }
    }
    
    public func initLable (firstText: inout String?, secondText: inout String?, thirdText: inout String?) {
        firstText = nil
        secondText = nil
        thirdText = nil
    }
    
    
}
