//
//  main.swift
//  170906_Function
//
//  Created by SIMA on 2017. 9. 14..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

func add(num1: Int, num2: Int) -> Int
{
    return num1 + num2
}

print(add(num1: 3, num2: 5))

func sub(num1: Int, num2: Int) -> Int
{
    return num1 - num2
}

print(sub(num1: 6, num2: 1))

func mul(num1: Int, num2: Int) -> Int
{
    return num1 * num2
}

print(mul(num1: 9, num2: 4))

func div(num1: Int, num2: Int) -> Double
{
    return Double(num1) / Double(num2)
}

print(div(num1: 18, num2: 9))
