//
//  Vending.swift
//  VendingMachine
//
//  Created by SIMA on 2017. 9. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Vending {
    var lackMoney: String = ""      //돈이 부족했을 때 가지고 있던 금액을 따로 저장하기 위한 변수
    
    init() {
        
    }
    //아이템을 선택해서 샀을 때 실핼하기 위한 함수
    func buyItem(remainButton: String, priceButton: String) -> String {
        var tmpRemainButton: String = remainButton
        if tmpRemainButton != "돈 넣으세요!!" && tmpRemainButton != "남은 금액" {
            if Int(tmpRemainButton)! - Int(priceButton)! >= 0 {
                tmpRemainButton = String(Int(tmpRemainButton)! - Int(priceButton)!)
            }else {
                lackMoney = remainButton
                tmpRemainButton = "돈 넣으세요!!"
            }
        }
        return tmpRemainButton
    }
    
    //입금 버튼을 눌렀을 때의 함수
    func addMoney (remainButton: String, depositButton: String) -> String{
        var tmpRemainButton: String = remainButton
        if tmpRemainButton == "돈 넣으세요!!" {
            tmpRemainButton = lackMoney
        }
        switch depositButton {
        case "100만원" :
            tmpRemainButton = String(Int(tmpRemainButton)! + 1000000)
        case "500만원" :
            tmpRemainButton = String(Int(tmpRemainButton)! + 5000000)
        case "1000만원" :
            tmpRemainButton = String(Int(tmpRemainButton)! + 10000000)
        default :
            print("a")
        }
        return tmpRemainButton
    }
    
    //아이템 가격을 눌렀을 때 반응하는 함수
    func itemPriceView (btn: String) -> String{
        var tmpItemPrice: String = ""
        switch btn {
        case "mactracker" :
            tmpItemPrice = "3000000"
        case "appletv" :
            tmpItemPrice = "500000"
        case "macpro" :
            tmpItemPrice = "20000000"
        case "applewatch" :
            tmpItemPrice = "8000000"
        case "macbook" :
            tmpItemPrice = "2000000"
        case "imac" :
            tmpItemPrice = "5000000"
        default :
            print("a")
        }
        return tmpItemPrice
    }
}
