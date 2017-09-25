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
    //게임 내
    private var isRunning: Bool = false
    private var displayNum: String = ""
    private var count: Int = 0
    private var strikeCount: Int = 0
    private var ballCount: Int = 0
    private let plzAnswerLb: String = "정답을 입력해주세요~"
    private let emptyLb: String = ""
    //연산 프로퍼티
    private var outCount: Int {
        get{
            let out = computer.ansArr.count - (strikeCount + ballCount)
            return out
        }
    }
    
    //MARK: - Class Init
    let computer: Computer = Computer()
    let user: User = User()
    let database: Database = Database()

    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initLable()
    }
    
    //MARK: - IBAction
    //버튼 입력 유저에서 받기
    @IBAction func numberClicked(_ sender: UIButton) {
        if isRunning {
//            strikeCount = 0
//            ballCount = 0
            resultTextLb.text = emptyLb
            user.clickNum(sender.tag, &firstTextLb.text, &secondTextLb.text, &thirdTextLb.text)
        }
    }
    
    //게임시작버튼을 눌렀을 때 작동하는 함수 (게임 내에 처리)
    @IBAction func gameStartBtn(_ sender: UIButton) {
        newGameStart()
        computer.ansArr = computer.generateAnswer()
        initLable()
    }
    
    //게임 "<-"버튼을 눌렀을 때 작동하는 함수 (게임 내에 처리)
    @IBAction func deleteBtn(_ sender: UIButton) {
        removeLb()
    }
    
    //확인 버튼을 눌렀을 때 발생하는 함수 (컴퓨터 & 유저에서 받은 값을 게임 내에서 처리)
    @IBAction func confirmBtn(_ sender: UIButton) {
        guard let thirdTextLb = thirdTextLb.text else { return }
        if isRunning {
            user.tryArr = user.arrangeNumber(firstTextLb.text, secondTextLb.text, thirdTextLb)
            compare()
            resultTextLb.text = afterResultText()
            database.currentHistory = database.afterHistoryText(resultTextLb.text, displayNum, count, strikeCount, &isRunning)
            historyText.text = database.gameHistory
            initLable()
        }
    }
    
    //MARK: - Game Function
    //게임에서 처리해야 할 함수
    private func initLable () {
        firstTextLb.text = nil
        secondTextLb.text = nil
        self.thirdTextLb.text = nil
        user.tryArr = []
        strikeCount = 0
        ballCount = 0
    }

    //새로운 겜 시작
    private func newGameStart() {
        count = 0
        isRunning = true
        historyText.text = emptyLb
        resultTextLb.text = plzAnswerLb
        database.gameHistory = emptyLb
    }
    
    //현재의 정답과 유저를 통해 받아온 값을 비교하는 함수
    private func compare () {
        displayNum = firstTextLb.text! + secondTextLb.text! + thirdTextLb.text!
        for ansIndex in 0 ..< computer.ansArr.count {
            for tryIndex in 0 ..< user.tryArr.count {
                if user.tryArr[tryIndex] == computer.ansArr[ansIndex] && tryIndex == ansIndex {
                    strikeCount += 1
                }else if user.tryArr[tryIndex] == computer.ansArr[ansIndex] && tryIndex != ansIndex {
                    ballCount += 1
                }
            }
        }
        count += 1
    }
    
    //지우기 버튼을 눌렀을 때 마지막 자리에 nil값이 들어있는지 확인 후, 없을 경우 앞에 자리를 확인하며 값이 있는 경우 nil값으로 바꿈
    private func removeLb() {
        if isRunning {
            if thirdTextLb.text != nil {
                thirdTextLb.text = nil
            }else if secondTextLb.text != nil {
                secondTextLb.text = nil
            }else {
                firstTextLb.text = nil
            }
        }
    }
    
    //버튼 눌렀을 때 결과 값 출력
    private func afterResultText () -> String {
        if strikeCount == computer.ansArr.count {
            return "정답!! 짝짝짝"
        }else {
            return "\(strikeCount)S \(ballCount)B \(outCount)O"
        }
    }
    
}

