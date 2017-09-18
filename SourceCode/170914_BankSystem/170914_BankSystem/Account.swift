//
//  Account.swift
//  170914_BankSystem
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation


class Account {
    var bankName: String = ""
    var amountMoney: Int = 0
    
    init(bankName: String) {
        self.bankName = bankName
    }
    
    init() {
        
    }
    func deposit (Money: Int) -> Int {
        amountMoney += Money
        return amountMoney
    }
    
    func withdrawal (Money: Int) -> Int{
        if amountMoney - Money < 0 {
            print("잔액부족!!")
        }else {
            amountMoney -= Money
        }
        return amountMoney
    }
    
}
