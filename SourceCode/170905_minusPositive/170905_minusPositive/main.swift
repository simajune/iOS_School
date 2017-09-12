//
//  main.swift
//  170905_minusPositive
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//뺄셈이 항상 양수가 되도록 변경(큰수에서 작은수를 빼도록)


import Foundation

var minusNum1: Int = 3
var minusNum2: Int = 4
var totalVal: Int = 0

if minusNum1 - minusNum2 < 0{
    minusNum1 = minusNum1 * (-1)
    minusNum2 = minusNum2 * (-1)
}
totalVal = minusNum1 - minusNum2
print(totalVal)
