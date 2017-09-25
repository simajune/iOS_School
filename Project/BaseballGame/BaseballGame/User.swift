//
//  Baseball.swift
//  BaseballGame
//
//  Created by SIMA on 2017. 9. 21..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation
class User {
    
    //MARK: - Property
    var tryArr: [String] = []
    
    
    //MARK: - Method
    
    // 버튼을 눌렀을 때 동작 -> view controller에서 해주는 것이 좋음
    func clickNum (_ tagNum: Int, _ firstText: inout String?, _ secondText: inout String?, _ thirdText: inout String?) {
        if firstText != nil && secondText != nil && thirdText != nil{
        }else if firstText != nil && secondText != nil {
            if String(tagNum) != firstText && String(tagNum) != secondText{
                thirdText = String(tagNum)
            }
        }else if firstText != nil {
            if firstText != String(tagNum) {
                secondText = String(tagNum)
            }
        }else {
            firstText = String(tagNum)
        }
    }
    
    //확인 버튼 눌렀을 때 정렬
    func arrangeNumber (_ firstText: String?, _ secondText: String?, _ thirdText: String?) -> [String]{
        var tryArr: [String] = []
        tryArr.append(firstText!)    //유저
        tryArr.append(secondText!)
        tryArr.append(thirdText!)
        

        return tryArr
    }
    
    
    
    
    
    
}
