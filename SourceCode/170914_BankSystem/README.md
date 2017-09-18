# 은행 계좌 만들기

1. 계좌클래스에는 은행의 이름과 돈의 양을 프로퍼티로 지정하고 초기화 값으로 은행의 이름을 초기화로 설정을 한다.
2. 메서드는 예금과 출금을 만들어 계좌에서 돈이 입출금이 되도록 했다.
3. 고객 클래스에는 이름과 주소 그리고 계좌를 프로퍼티로 지정하고 초기화 값으로 이름과 주소를 설정한다. 
4. 메서드는 총 금액과 계좌 등록을 만든다.

** **

—main.swift

```swift
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
```

—Account.swift

```swift
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
```

—Customers.swift

```swift
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
```

