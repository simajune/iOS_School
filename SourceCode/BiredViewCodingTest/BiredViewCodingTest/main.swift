//
//  main.swift
//  BiredViewCodingTest
//
//  Created by SIMA on 2018. 3. 20..
//  Copyright © 2018년 devtejay. All rights reserved.
//

import Foundation

class CoupleMatching {
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let string = String(data: inputData, encoding: .utf8)
        let strData = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)
        print(string)
        let trimmed = string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let trimmedString = strData?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        return string!
    }
    
}
//
//func input() -> String {
//    let keyboard = FileHandle.standardInput
//    let inputData = keyboard.availableData
//    let strData = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)
//    let trimmedString = strData?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//
//    return trimmedString!
//}

var start = CoupleMatching()
let inputString = start.input()
print("Hello \(inputString)")
