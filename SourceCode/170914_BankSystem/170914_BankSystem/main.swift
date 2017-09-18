//
//  main.swift
//  170914_BankSystem
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

print("Hello, World!")

var list = (num1: 4245, str: "name")


print(list.num1)

//let account1: Account = Account(bankName: "우리은행")
let account1: Account = Account()
account1.bankName = "우리은행"
print(account1.bankName)

print(account1.deposit(Money: 50000))


let account2: Account = Account(bankName: "카카오뱅크")
print(account2.deposit(Money: 105812200))


let name: Customers = Customers(name: "이름", address: "강북")
name.registAccount(account: account1)
name.registAccount(account: account2)

print(name.totalAmount())
