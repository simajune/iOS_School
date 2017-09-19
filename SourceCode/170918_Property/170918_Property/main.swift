//
//  main.swift
//  170918_Property
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var system: Rect = Rect()

system.origin = Point(x: 5.0, y: 1.0)
system.size = Size(width: 5.0, height: 10.0)

print(system.center.x, system.center.y)

system.center = Point(x: 10.0, y: 10.0)

print(system.origin.x)
/////////////////////////////////////////////////////////
var changeValue:Int = 0{
    didSet(oldV){
        print("oldValue \(oldV)")
    }
    willSet(willV)
    {
        print("newValue \(willV)")
    }
}
changeValue = 4
