//
//  Customers.swift
//  170914_BankSystem
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Customers {
    let name: String
    var address: String
    var accounts: [Account] = []
    
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    func totalAmount () -> Int {
        var totalAmount: Int = 0
        for account in accounts {
            totalAmount += account.amountMoney
        }
        return totalAmount
    }
    
    func registAccount (account: Account) {
        accounts.append(account)
    }
    
}
