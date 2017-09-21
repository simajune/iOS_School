//
//  ViewController.swift
//  BaseballGame
//
//  Created by SIMA on 2017. 9. 21..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - UI Property
    @IBOutlet var resultTextLb: UILabel!
    @IBOutlet var firstTextLb: UILabel!
    @IBOutlet var secondTextLb: UILabel!
    @IBOutlet var thirdTextLb: UILabel!
    @IBOutlet var historyText: UITextView!
    
    //MARK: - Property
    private var count: Int = 0
    private var strikeCount: Int = 0
    private var ballCount: Int = 0
    private var displayNum: String = ""
    private var isRunning: Bool = false
    private var ansArr: [String] = []
    private var tryArr: [String] = []
    
    //MARK: - Class Init
    let computer: Computer = Computer()
    let user: User = User()
    
    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initLable()
    }
    
    
    //MARK: - IBAction
    @IBAction func numberClicked(_ sender: UIButton) {
        if isRunning {
            strikeCount = 0
            ballCount = 0
            resultTextLb.text = ""
            user.clickNum(sender.tag, &firstTextLb.text, &secondTextLb.text, &thirdTextLb.text)
        }
    }
    //컴퓨터
    @IBAction func gameStartBtn(_ sender: UIButton) {
        newGameStart()
        ansArr = computer.generateRandom()
        computer.initLable(firstText: &firstTextLb.text, secondText: &secondTextLb.text, thirdText: &thirdTextLb.text)

    }
    //컴퓨터
    @IBAction func deleteBtn(_ sender: UIButton) {
        computer.removeLb(running: isRunning, firstText: &firstTextLb.text, secondText: &secondTextLb.text, thirdText: &thirdTextLb.text)
    }
    //컴퓨터 & 유저
    @IBAction func confirmBtn(_ sender: UIButton) {
        guard let thirdTextLb = thirdTextLb.text else { return }
        if isRunning {
            tryArr = user.arrangeNumber(firstTextLb.text, secondTextLb.text, thirdTextLb, displayNumer: &displayNum)
            initLable()
            compare()
            resultTextLb.text = computer.afterConfirmResultText(ballCount, strikeCount)
            historyText.text! += computer.afterConfirmHistoryText(resultTextLb.text, displayNum, count, strikeCount, &isRunning)
            tryArr = []
        }
    }
    
    //컴퓨터
    private func initLable () {
        firstTextLb.text = nil
        secondTextLb.text = nil
        self.thirdTextLb.text = nil
    }
    
    func newGameStart() {
        count = 0
        isRunning = true
        historyText.text = ""
        resultTextLb.text = "정답을 입력해주세요"
    }
    
    func compare () {
        for ansIndex in 0 ..< ansArr.count {
            for tryIndex in 0 ..< tryArr.count {
                if tryArr[tryIndex] == ansArr[ansIndex] && tryIndex == ansIndex {
                    strikeCount += 1
                }else if tryArr[tryIndex] == ansArr[ansIndex] && tryIndex != ansIndex {
                    ballCount += 1
                }
            }
        }
        count += 1
    }
    
}

