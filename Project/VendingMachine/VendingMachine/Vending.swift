//
//  Vending.swift
//  VendingMachine
//
//  Created by SIMA on 2017. 9. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation


public class Vending {
    
    var lackMoney: String = ""      //돈이 부족했을 때 가지고 있던 금액을 따로 저장하기 위한 변수
    private let lackLabel: String = "돈을 넣으세요!!"
    private let initLabel: String = "남은 금액"
    
    //아이템을 선택해서 샀을 때 실핼하기 위한 함수
    func buyItem(remainBtnTitle: String, priceBtnTitle: String, remainWonLabel: inout String) -> String {
        var remainBtnTitle: String = remainBtnTitle
        
        if remainBtnTitle != lackLabel && remainBtnTitle != initLabel {
            let resultMoney: Int = Int(remainBtnTitle)! - Int(priceBtnTitle)!
            if resultMoney >= 0 {
                remainBtnTitle = String(Int(remainBtnTitle)! - Int(priceBtnTitle)!)
            }else {
                lackMoney = remainBtnTitle
                remainBtnTitle = lackLabel
                remainWonLabel = ""
            }
        }
        return remainBtnTitle
    }
    
    //입금 버튼을 눌렀을 때의 함수
    func addMoney (remainBtnTitle: String, depositBtnTitle: Int) -> String{
        var remainBtnTitle: String = remainBtnTitle
        
        if remainBtnTitle == initLabel { remainBtnTitle = "0" }
        
        if remainBtnTitle == lackLabel { remainBtnTitle = lackMoney }
        
        switch depositBtnTitle {
        case 0 :
            remainBtnTitle = String(Int(remainBtnTitle)! + 1000000)
        case 1 :
            remainBtnTitle = String(Int(remainBtnTitle)! + 5000000)
        case 2 :
            remainBtnTitle = String(Int(remainBtnTitle)! + 10000000)
        default :
            print("a")
        }
        return remainBtnTitle
    }
    
    //아이템 가격을 눌렀을 때 반응하는 함수
    func itemPriceView (btnTitle: Int) -> String{
        var tmpItemPrice: String = ""
        switch btnTitle {
        case 0 :
            tmpItemPrice = "3000000"
        case 1 :
            tmpItemPrice = "500000"
        case 2 :
            tmpItemPrice = "20000000"
        case 3 :
            tmpItemPrice = "8000000"
        case 4 :
            tmpItemPrice = "2000000"
        case 5 :
            tmpItemPrice = "5000000"
        default :
            print("a")
        }
        return tmpItemPrice
    }
}

