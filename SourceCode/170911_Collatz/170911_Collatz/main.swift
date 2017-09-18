//
//  main.swift
//  0911_Collatz
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

///////Collatz함수//////////////
func collatz (number: Int) -> Int {
    var tmpNum: Int = number
    var count: Int = 0
    
    while number > 1 {
        if tmpNum % 2 == 0 {
            tmpNum /= 2
            count += 1
        }else {
            tmpNum = 3 * tmpNum + 1
            count += 1
        }
        
        if tmpNum == 1 {
            return count
        }
        
        if count > 500 {
            return -1
        }
    }
    return count
}

print(collatz(number: 123286325789578297))
