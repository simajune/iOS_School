//
//  main.swift
//  170911_Dimensions
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.


//  output 단위까지 생각해보기


import Foundation

//func lengthConvert (unit: String, value: Double) -> Double {
//    let tmpValue: Double = value
//    var resultValue: Double = 0
//    if unit == "inch" {
//        resultValue = tmpValue * 2.54
//    } else if unit == "cm" {
//        resultValue = tmpValue / 2.54
//    }
//    return resultValue
//}
//
//func volConvert (unit: String, value: Double) -> Double {
//    let tmpValue: Double = value
//    var resultValue: Double = 0
//    if unit == "pyeong" {
//        resultValue = tmpValue / 0.393701
//    } else if unit == "m2" {
//        resultValue = tmpValue * 0.393701
//    }
//    return resultValue
//}
//
//func tempConvert (unit: String, value: Double) -> Double {
//    let tmpValue: Double = value
//    var resultValue: Double = 0
//    if unit == "cel" {
//        resultValue = tmpValue * 32
//    } else if unit == "fab" {
//        resultValue = tmpValue / 32
//    }
//    return resultValue
//}
//
//func dataConvert (unit: String, value: Double) -> Double {
//    let tmpValue: Double = value
//    var resultValue: Double = 0
//    if unit == "kb" {
//        resultValue = tmpValue * 1024
//    } else if unit == "mb" {
//        resultValue = tmpValue * 1024
//    }
//    return resultValue
//}
//
//func timeConvert (unit: String, value: Int) -> Int {
//    var tmpValue: Int = value
//    var resultValue: Int = 0
//    if unit == "time" {
//        resultValue = tmpValue % 100
//        tmpValue /= 100
//        resultValue += 60 * (tmpValue % 100)
//        tmpValue /= 100
//        resultValue += 3600 * tmpValue
//    }else if unit == "second" {
//        resultValue = tmpValue / 3600
//        tmpValue = tmpValue % 3600
//        resultValue = resultValue * 100 + (tmpValue / 60)
//        tmpValue = tmpValue % 60
//        resultValue = resultValue * 100 + tmpValue
//    }
//    
//    return resultValue
//}
//print(timeConvert(unit: "second", value: 3600))

////////다른 방법///////////////////
//func timeConvert (unit: String, value: Int) -> Int {
//    var tmpValue: Int = value
//    var tmpNum: Int = 0
//    var resultValue: Int = 0
//    
//    if unit == "time" {
//        while tmpNum < 2 {
//            resultValue += (60 * tmpNum) * (tmpValue % 100)
//            tmpValue /= 100
//            tmpNum += 1
//            print(resultValue)
//        }
//        if tmpNum == 2 {
//            resultValue += (60 * tmpNum) * tmpValue
//        }
//    }
//    return resultValue
//}

//print(timeConvert(value: 11320))

///////Collatz함수//////////////
//func collatz (number: Int) -> Int {
//    var tmpNum: Int = number
//    var count: Int = 0
//    
//    while number > 1 {
//        if tmpNum % 2 == 0 {
//            tmpNum /= 2
//            count += 1
//        }else {
//            tmpNum = 3 * tmpNum + 1
//            count += 1
//        }
//        
//        if tmpNum == 1 {
//            return count
//        }
//        
//        if count > 500 {
//            return -1
//        }
//    }
//    return count
//}
//
//print(collatz(number: 123286325789578297))


//////Harshad수 찾기

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
