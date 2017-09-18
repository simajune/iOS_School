//
//  main.swift
//  170918_Switch
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

print("Hello, World!")

func getGrade (withPoint point: Int) -> String{
    var grade: String = "F"
    
    switch point{
    case 95 ... 100 :
        grade = "A+"
    case 90 ..< 95 :
        grade = "A"
    case 85 ..< 90 :
        grade = "B+"
    case 80 ..< 85 :
        grade = "B"
    default :
        grade = "F"
    }
    return grade
}

func getGrade2 (withPoint point: Double) -> String{
    var grade: String = "F"
    
    switch point{
    case let p where (p > 90 && p <= 100) :
        grade = "A+"
    case let p where (p > 80 && p <= 90) :
        grade = "A"
    case let p where (p > 70 && p <= 80) :
        grade = "B+"
    case let p where (p > 60 && p <= 70) :
        grade = "B"
    default :
        grade = "F"
    }
    return grade
}

func getPoint(somePoint:(Int,Int))
{
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
}

getPoint(somePoint: (-1, 0))


//func guguDan (soemInt: (Int, Int)) {
//    
//}

