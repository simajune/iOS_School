//
//  main.swift
//  170919_Enum
//
//  Created by SIMA on 2017. 9. 19..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

enum Planet: Int {
        case tab
        case you
        case line = 2
}

var tmpPlanet: Planet = Planet(rawValue: 1)!
print(tmpPlanet)

var productBarcode:Barcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


func upcConvert (numberSystem: Int) {
    print("numberSystem is \(numberSystem)")
}


switch productBarcode {
case .upc(let numberSystem, _, _, _):
    //print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    print("UPC: \(numberSystem)")
    upcConvert(numberSystem: numberSystem)
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

enum Person {
    case Student(String)
    case Worker(String)
    case Preschooler
    case NoJob
    case HouseWife
}



func confirmCareer (tmpcareer: String) -> String {
    return tmpcareer
}

var career: Person = Person.Student("middleSchool")

switch career {
case .Student(let school) :
    print(school)
case .Worker(let career) :
    //confirmCareer(tmpcareer: career)
    print(confirmCareer(tmpcareer: career))
case .Preschooler :
    print("Preschooler")
case .NoJob :
    print("NoJob")
case .HouseWife :
    print("HouseWife")
}

func test(num: Int) -> Int {
    var total: Int = num
    
    if num == 1 {
        return 1
    }
    
    total *= test(num: num - 1)
    
    return total
}

print(test(num: 5))



func pibonachi(num: Int) -> Int{
    
    if num == 1 || num == 2 {
        return 1
    }
    return pibonachi(num: num - 1) + pibonachi(num: num - 2)
}
print(pibonachi(num: 7))


////////////옵셔널////////////////////
var a: Int? = Optional.none

class Number {
    var num1: Int
    var num2: Int
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
}

var number: Number = Number(num1: 10, num2: 5)

enum add {
    case plus((Int, Int) -> Int)
}

    var operation = add.plus(+)



var name: String? = "Taejune"
var age: Int? = 31

print("my name is \(name!)")
