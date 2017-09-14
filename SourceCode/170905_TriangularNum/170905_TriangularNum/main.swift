//
//  main.swift
//  170905_TriangularNum
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

//삼각수란 1부터 모든 수의 합이다. ex> 삼각수 10 = 55
var index: Int = 0
var inputValue = 15
var triangleNum: Int = 0




while index <= inputValue{
    triangleNum += index
    index += 1
}

triangleNum = (inputValue / 2) * (inputValue + 1) / 2 + (inputValue + 1) / 2

print(triangleNum)
