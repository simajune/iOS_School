//
//  main.swift
//  170920_Closure
//
//  Created by SIMA on 2017. 9. 20..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

let closureParam: (Int) -> Int = { (cNum) -> Int in
        return cNum * 10
}

func closureTest(textNum num: Int, closure:(Int) -> Int) {
    if num > 10 {
        print(closure(num))
    }
}

closureTest(textNum: 11, closure: closureParam)
//////////////////////////////////////////////////////////////////

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

print(names.sorted())
//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
let sorted = names.sorted(by:
{(_ s1: String,_ s2: String) -> Bool in
    return s1 < s2
}
)
print(sorted)

var dic: [String: Int] = ["name": 0, "address":1]
//////////////////////////////////////////////////////////////////



func calculation(fNum: Double, eNum: Double, oper: @escaping (Double, Double) -> Double) -> (Double,Double) -> Double {
    let doubleCalculation: (Double, Double) -> Double = oper
    return doubleCalculation
}

print(calculation(fNum: 12, eNum: 15, oper: / ))




let operDic: [String: (Int,Int) -> Int] = ["+": {(n1,n2) -> Int in return n1 + n2},
                                           "-": {(n1,n2) -> Int in return n1 - n2},
                                           "*": {(n1,n2) -> Int in return n1 * n2},
                                           "/": {(n1,n2) -> Int in return n1 / n2},]

print(operDic["+"]!(3,4))

