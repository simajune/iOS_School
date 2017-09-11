//
//  main.swift
//  170905_evenOdd
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//  testNum의 값이 짝수인지 홀수인지 판별

import Foundation

var testNum: Int = 11
var isEvenNum: Bool

if testNum%2 == 1{
    isEvenNum = true
    print("testNum \(testNum)는 홀수 입니다.")
}else{
    isEvenNum = false
    print("testNum \(testNum)는 짝수 입니다.")
}
