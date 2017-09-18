//
//  main.swift
//  170911_Harshard
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

/////Harshad수 찾기

func harshad (inputNum: Int) -> Bool {
    var tmpNum: Int = inputNum
    var tmpDigit: Int = 0
    var resultValue : Bool = true
    
    while tmpNum > 0 {                  //각 자리수 더하는 경우
        tmpDigit += tmpNum % 10
        tmpNum /= 10
    }
    
    if inputNum % tmpDigit == 0 {
        resultValue = true
    } else {
        resultValue = false
    }
    return resultValue
}

print(harshad(inputNum: 10))
