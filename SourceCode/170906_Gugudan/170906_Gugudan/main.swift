//
//  main.swift
//  170906_Gugudan
//
//  Created by SIMA on 2017. 9. 14..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

func guguFull()
{
    for index in 1 ... 9
    {
        guguDan(dan: index)
    }
}

func guguDan(dan: Int)
{
    print("=== \(dan)단 ===")
    for index in 1 ... 9
    {
        print("\(dan) X \(index) = \(dan * index)")
        if index == 9{
            print("\n")
        }
    }
}

guguFull()
