//
//  ViewController.swift
//  VendingMachine
//
//  Created by SIMA on 2017. 9. 15..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //mactracker의 가격은 300만원, 애플티비는 50만원, 맥프로는 2000만원, 애플와치는 80만원, 맥북은 200만원, 아이맥은 500만원
    @IBOutlet var itemPrice: UILabel!       //아이템 가격을 나타내는 레이블
    @IBOutlet var remainAmount: UILabel!    //남은 금액을 나타내는 레이블
    @IBOutlet var priceWon: UILabel!        //가격 뒤에 "원"을 나타내기 위한 레이블
    @IBOutlet var remainWon: UILabel!       //남은 금액 뒤에 "원"을 나타내기 위한 레이블
    let wonLabel: String = "원"
    
    let machine: Vending = Vending()        //클래스 초기화

    override func viewDidLoad() {
        super.viewDidLoad()
        priceWon.text! = ""                 //레이블 초기 값은 없음
        remainWon.text! = ""                //레이블 초기 값은 없음
    }
    
    //아이템을 눌렀을 때 가격이 나오게 하는 함수
    @IBAction func vendingItem(_ sender: UIButton) {
        priceWon.text! = wonLabel
        itemPrice.text! =  machine.itemPriceView(btn: sender.titleLabel!.text!)
    }
    //입금 버튼을 눌렀을 때 남은 금액 가격 레이블을 변화시키는 함수
    @IBAction func moneyInput(_ sender: UIButton) {
        remainWon.text! = wonLabel
        remainAmount.text! =  machine.addMoney(remainButton: remainAmount.text!, depositButton: sender.titleLabel!.text!)
    }
    
    //아이템을 선택해서 샀을 때 남은 금액의 레이블을 변화시키기 위한 함수
    @IBAction func selectItem(_ sender: UIButton) {
        remainAmount.text! = machine.buyItem(remainButton: remainAmount.text!, priceButton: itemPrice.text!, remainWonLabel: &remainWon.text!)
    }
}

