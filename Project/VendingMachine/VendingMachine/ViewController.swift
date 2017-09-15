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
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var remainAmount: UILabel!
    var selectItem: String = ""
    var priceView: Int = 0
    var depositMoney: String = ""
    var lackMoney: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func vendingItem(_ sender: UIButton) {
        itemPriceView(btn: sender.titleLabel!.text!)
    }
    @IBAction func moneyInput(_ sender: UIButton) {
        if remainAmount.text! == "남은 금액" {
            remainAmount.text! = "0"
        }
        addMoney(btn: sender.titleLabel!.text!)
    }
    @IBAction func selectItem(_ sender: UIButton) {
        buyItem()
    }
    
    func buyItem() {
        if Int(remainAmount.text!)! - Int(itemPrice.text!)! >= 0 {
        remainAmount.text! = String(Int(remainAmount.text!)! - Int(itemPrice.text!)!)
        }else {
            lackMoney = remainAmount.text!
            remainAmount.text! = "돈 넣으세요!!"
        }
    }
    
    func addMoney (btn: String) {
        if remainAmount.text! == "돈 넣으세요!!" {
            remainAmount.text! = lackMoney
        }
        depositMoney = btn
        switch depositMoney {
        case "100만원" :
            remainAmount.text! = String(Int(remainAmount.text!)! + 1000000)
        case "500만원" :
            remainAmount.text! = String(Int(remainAmount.text!)! + 5000000)
        case "1000만원" :
            remainAmount.text! = String(Int(remainAmount.text!)! + 10000000)
        default :
            print("a")
        }
    }
    
    func itemPriceView (btn: String) {
        selectItem = btn
        switch selectItem {
        case "mactracker" :
            itemPrice.text! = "3000000"
        case "appletv" :
            itemPrice.text! = "500000"
        case "macpro" :
            itemPrice.text! = "20000000"
        case "applewatch" :
            itemPrice.text! = "8000000"
        case "macbook" :
            itemPrice.text! = "2000000"
        case "imac" :
            itemPrice.text! = "5000000"
        default :
            print("a")
        }
    }

}

