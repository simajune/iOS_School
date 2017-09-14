//
//  main.swift
//  170911_Dimensions
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.


///////////Harshad수 찾기///////////////////////////////

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















////////1번 문제///////////
//1. inch to cm, cm to inch (2개)
//import Foundation
//
//func inchToCm (inch: Double) -> Double {
//    return inch * 2.54
//}
//
//func cmToInch (cm: Double) -> Double {
//    return cm / 2.54
//}
//
//func lengthConvert (unit: String, value: Double) -> Double {
//    var resultValue: Double = 0
//    if unit == "inch" {
//        resultValue = inchToCm(inch: value)
//    } else if unit == "cm" {
//        resultValue = cmToInch(cm: value)
//    }
//    return resultValue
//}
//
//print(lengthConvert(unit: "cm", value: 1.312))
//

//////////2번 문제///////////
//2. m2 to 평, 평 to m2 (2개)

//func pyeongToM2 (pyeong: Double) -> Double {
//    return pyeong / 0.393701
//}
//
//func m2ToPyeong (m2: Double) -> Double {
//    return m2 * 0.393701
//}
//
//func volConvert (unit: String, value: Double) -> Double {
//    var resultValue: Double = 0
//    if unit == "pyeong" {
//        resultValue = pyeongToM2(pyeong: value)
//    } else if unit == "m2" {
//        resultValue = m2ToPyeong(m2: value)
//    }
//    return resultValue
//}
//
//print(volConvert(unit: "m2", value: 12.11))

////////3번 문제///////////
//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)

//func celToFab (celsius :Double) -> Double {
//    return (celsius - 32) / 1.8
//}
//
//func fabToCel (Fahrenheit: Double) -> Double {
//    return (Fahrenheit * 1.8) + 32
//}
//
//func tempConvert (unit: String, value: Double) -> Double {
//    var resultValue: Double = 0
//    if unit == "cel" {
//        resultValue = celToFab(celsius: value)
//    } else if unit == "fab" {
//        resultValue = fabToCel(Fahrenheit: value)
//    }
//    return resultValue
//}
//
//print(tempConvert(unit: "cel", value: 3.11))

//////////4번 문제///////////
//4. 데이터량 (KB to MB, MB to GB) (2개)
//func kbToMb (kb: Int) -> Int {
//    return kb * 1024
//}
//
//func mbToGb (mb: Int) -> Int {
//    return mb * 1024
//}
//
//func dataConvert (unit: String, value: Int) -> Int {
//    var resultValue: Int = 0
//    if unit == "kb" {
//        resultValue = kbToMb(kb: value)
//    } else if unit == "mb" {
//        resultValue = mbToGb(mb: value)
//    }
//    return resultValue
//}
//
//print(dataConvert(unit: "kb", value: 126))


//////////5번 문제///////////
//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 11320 >> 4400초
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
//    return resultValue
//}
//print(timeConvert(unit: "second", value: 4400))


////////다른 방법///////////////////효율성 떨어짐
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
//
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
//print(collatz(number: 12512))
//
//print(collatz(number: 123286325789578297))

