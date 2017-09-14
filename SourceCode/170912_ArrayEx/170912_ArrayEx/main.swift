//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
import Foundation
//- 시저 암호: 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. A를 3만큼 밀면 D가 되고 z를 1만큼 밀면 a가 됩니다
//1. 함수 입력 : ceasar(data:[“a”, ”B”, ”C”, ”d”], keyNum:4)
//2. 결과 : [“e”, ”F”, ”G”, ”h”]
var smallAlphabet: String = "abcdefghijklmnopqrstuvwxyz"
var capitalAlphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let smallArray: [Character] = Array(smallAlphabet.characters)
let capitalArray: [Character] = Array(capitalAlphabet.characters)

func ceasar(data: [Character], keyNum: Int) -> [Character] {
    var tmpArray: [Character] = data
    var resultArray: [Character] = []
    var tmpIndex: Int = 0
    
    for index in 0 ..< tmpArray.count {
        for smallIndex in smallArray {
            if tmpArray[index] == smallIndex {
                if (smallArray.index(of: smallIndex)! + keyNum > 25) {
                    tmpIndex = (smallArray.index(of: smallIndex)! + keyNum) % 26
                }else {
                    tmpIndex = (smallArray.index(of: smallIndex)! + keyNum)
                }
                resultArray.append(smallArray[tmpIndex])
            }
        }
        for capitalIndex in capitalArray {
            if tmpArray[index] == capitalIndex {
                if (capitalArray.index(of: capitalIndex)! + keyNum > 25) {
                    tmpIndex = (capitalArray.index(of: capitalIndex)! + keyNum) % 26
                }else {
                    tmpIndex = (capitalArray.index(of: capitalIndex)! + keyNum)
                }
                resultArray.append(capitalArray[tmpIndex])
            }
        }
    }
    return resultArray
}
print(ceasar(data: ["f", "B", "Y", "h"], keyNum: 4))


//- 요일 구하기: 2017년도 1월 1일은 일요일 입니다. 그렇다면 내가 원하는 월/일을 받아서 해당 날의 요일을 구하는 함수를 만들어 보세요.
//1. 함수 입력 :getWeekDay(atMonth:3, day: 13)
//2.리턴결과: “Mon”

//let weekDay: [String] = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
//let monthCount: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//
//func getWeekDay (atMonth: Int, day: Int) -> String {
//    var preMonthCount: Int = 0
//    var tmpDay: Int = 0
//    var resultDay: String = ""
//    for index in 0 ..< (atMonth - 1) {
//        preMonthCount += monthCount[index]
//    }
//    tmpDay = preMonthCount + day - 1
//    tmpDay = tmpDay % 7
//    resultDay = weekDay[tmpDay]
//    return resultDay
//}
//
//print(getWeekDay(atMonth: 9, day: 12))


//- 중복 숫자 줄이기: 연속으로 중복된 숫자를 없애는 함수
//1. 함수 입력 : shoter(num:1002233422)
//2.리턴결과: 102342
//func numToArray (num: Int) -> [Int] {
//    var tmpNum: Int = num
//    var number: Int = 0
//    var resultArray: [Int] = []
//
//    while tmpNum > 0 {
//        number = tmpNum % 10
//        resultArray.insert(number, at: 0)
//        tmpNum /= 10
//    }
//    return resultArray
//}
//
//func shoter (num: Int) -> Int {
//    var newArray: [Int] = numToArray(num: num)
//    var resultValue: Int = 0
//
//    for index in 0 ..< newArray.count {
//        if index == 0 {
//            resultValue = newArray[index]
//        }else {
//            if newArray[index] != newArray[index - 1] {
//                resultValue *= 10
//                resultValue += newArray[index]
//            }
//        }
//    }
//    return resultValue
//}
//print(shoter(num: 12233422))


//- 소수찾기 : 2부터 입력된 숫자까지의 모든 소수를 찾아서 반환
//1. 함수 입력 : allPrimeNumber(endNum:10)
//2.결과: [2,3,5,7]

//func allPrimeNumber(endNum: Int) -> [Int] {
//    var resultArray: [Int] = []
//    resultArray += 2 ... endNum
//
//    for index in 2 ... endNum {
//        for arrayIndex in resultArray {
//            if (arrayIndex % index == 0) && (arrayIndex / index > 1) {
//                let num: Int = resultArray.index(of: arrayIndex)!
//                resultArray.remove(at: num)
//            }
//        }
//    }
//    return resultArray
//}
//
//print(allPrimeNumber(endNum: 20))
