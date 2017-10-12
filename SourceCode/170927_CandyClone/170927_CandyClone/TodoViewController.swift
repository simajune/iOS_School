//
//  TodoViewController.swift
//  170927_CandyClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    var firstCheckBox: UIButton!
    var secondCheckBox: UIButton!
    var thirdCheckBox: UIButton!
    var fourthCheckBox: UIButton!
    var fifthCheckBox: UIButton!

    @IBOutlet var firstLB: UILabel!
    @IBOutlet var secondLB: UILabel!
    @IBOutlet var thirdLB: UILabel!
    @IBOutlet var fourthLB: UILabel!
    @IBOutlet var fifthLB: UILabel!
    
    var listButton: UIButton!
    var clockButton: UIButton!
    var bellButton: UIButton!
    var userButton: UIButton!
    
    var bottomBar: UIView!
    
    @IBOutlet var settingBtn: UIButton!
    @IBOutlet var infoBtn: UIButton!
    @IBOutlet var contentsBtn: UIButton!
    @IBOutlet var plusBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstCheckBox = UIButton(type: .custom)
        firstCheckBox.frame = CGRect(x: 32, y: 208, width: 24, height: 24)
        firstCheckBox.setImage(#imageLiteral(resourceName: "Rectangle 3"), for: .normal)
        firstCheckBox.setImage(#imageLiteral(resourceName: "Group"), for: .selected)
        firstCheckBox.tag = 0
        firstCheckBox.isSelected = true
        firstCheckBox.addTarget(self, action: #selector(self.checkBoxClicked(_:)), for: .touchUpInside)
        view.addSubview(firstCheckBox)
        
        secondCheckBox = UIButton(type: .custom)
        secondCheckBox.frame = CGRect(x: 32, y: 264, width: 24, height: 24)
        secondCheckBox.setImage(#imageLiteral(resourceName: "Rectangle 3"), for: .normal)
        secondCheckBox.setImage(#imageLiteral(resourceName: "Group"), for: .selected)
        secondCheckBox.tag = 1
        secondCheckBox.isSelected = true
        secondCheckBox.addTarget(self, action: #selector(self.checkBoxClicked(_:)), for: .touchUpInside)
        view.addSubview(secondCheckBox)
        
        thirdCheckBox = UIButton(type: .custom)
        thirdCheckBox.frame = CGRect(x: 32, y: 320, width: 24, height: 24)
        thirdCheckBox.setImage(#imageLiteral(resourceName: "Rectangle 3"), for: .normal)
        thirdCheckBox.setImage(#imageLiteral(resourceName: "Group"), for: .selected)
        thirdCheckBox.isSelected = false
        thirdCheckBox.tag = 2
        thirdCheckBox.addTarget(self, action: #selector(self.checkBoxClicked(_:)), for: .touchUpInside)
        view.addSubview(thirdCheckBox)
        
        fourthCheckBox = UIButton(type: .custom)
        fourthCheckBox.frame = CGRect(x: 32, y: 376, width: 24, height: 24)
        fourthCheckBox.setImage(#imageLiteral(resourceName: "Rectangle 3"), for: .normal)
        fourthCheckBox.setImage(#imageLiteral(resourceName: "Group"), for: .selected)
        fourthCheckBox.isSelected = false
        fourthCheckBox.tag = 3
        fourthCheckBox.addTarget(self, action: #selector(self.checkBoxClicked(_:)), for: .touchUpInside)
        view.addSubview(fourthCheckBox)
        
        fifthCheckBox = UIButton(type: .custom)
        fifthCheckBox.frame = CGRect(x: 32, y: 432, width: 24, height: 24)
        fifthCheckBox.setImage(#imageLiteral(resourceName: "Rectangle 3"), for: .normal)
        fifthCheckBox.setImage(#imageLiteral(resourceName: "Group"), for: .selected)
        fifthCheckBox.isSelected = false
        fifthCheckBox.tag = 4
        fifthCheckBox.addTarget(self, action: #selector(self.checkBoxClicked(_:)), for: .touchUpInside)
        view.addSubview(fifthCheckBox)
        
        listButton = UIButton()
        listButton.frame = CGRect(x: 28, y: 633, width: 20, height: 12.5)
        listButton.setImage(#imageLiteral(resourceName: "List - simple-line-icons"), for: .normal)
        listButton.setImage(#imageLiteral(resourceName: "ListClicked"), for: .selected)
        listButton.isSelected = true
        listButton.tag = 0
        listButton.addTarget(self, action: #selector(self.bottomButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(listButton)
        
        clockButton = UIButton()
        clockButton.frame = CGRect(x: 103, y: 629.2, width: 20, height: 20)
        clockButton.setImage(#imageLiteral(resourceName: "clock"), for: .normal)
        clockButton.setImage(#imageLiteral(resourceName: "clockClicked"), for: .selected)
        clockButton.isSelected = false
        clockButton.addTarget(self, action: #selector(self.bottomButtonClicked(_:)), for: .touchUpInside)
        clockButton.tag = 1
        view.addSubview(clockButton)
        
        bellButton = UIButton()
        bellButton.frame = CGRect(x: 254.3, y: 629.3, width: 17.3, height: 20)
        bellButton.setImage(#imageLiteral(resourceName: "Bell"), for: .normal)
        bellButton.setImage(#imageLiteral(resourceName: "BellClicked"), for: .selected)
        bellButton.isSelected = false
        bellButton.addTarget(self, action: #selector(self.bottomButtonClicked(_:)), for: .touchUpInside)
        bellButton.tag = 2
        view.addSubview(bellButton)
        
        userButton = UIButton()
        userButton.frame = CGRect(x: 328, y: 629.2, width: 20, height: 20)
        userButton.setImage(#imageLiteral(resourceName: "User"), for: .normal)
        userButton.setImage(#imageLiteral(resourceName: "User"), for: .selected)
        userButton.isSelected = false
        userButton.addTarget(self, action: #selector(self.bottomButtonClicked(_:)), for: .touchUpInside)
        userButton.tag = 3
        view.addSubview(userButton)
        
        
        bottomBar = UIView(frame: CGRect(x: 0, y: 663, width: 75, height: 4))
        bottomBar.backgroundColor = UIColor(red: 36.0/255.0, green: 59.0/255.0, blue: 107.0/255.0, alpha: 1.0)
        view.addSubview(bottomBar)
        
        settingBtn.frame = CGRect(x: 160, y: 595, width: 56, height: 56)
        view.addSubview(settingBtn)
        settingBtn.isHidden = true
        
        infoBtn.frame = CGRect(x: 160, y: 595, width: 56, height: 56)
        view.addSubview(settingBtn)
        infoBtn.isHidden = true
        
        contentsBtn.frame = CGRect(x: 160, y: 595, width: 56, height: 56)
        view.addSubview(settingBtn)
        contentsBtn.isHidden = true
        
        plusBtn.addTarget(self, action: #selector(TodoViewController.plusBtnClicked(_:)), for: .touchUpInside)
        plusBtn.isSelected = false

    }
    
    
    @objc func checkBoxClicked (_ sender: UIButton){
        
        UIView.animate(withDuration: 0.5) {
            switch sender.tag {
            case 0:
                if sender.isSelected {
                    sender.isSelected = false
                    self.firstLB.alpha = 0.5
                    
                }else {
                    sender.isSelected = true
                    self.firstLB.alpha = 1.0
                }
            case 1:
                if sender.isSelected {
                    sender.isSelected = false
                    self.secondLB.alpha = 0.5
                    
                }else {
                    sender.isSelected = true
                    self.secondLB.alpha = 1.0
                }
            case 2:
                if sender.isSelected {
                    sender.isSelected = false
                    self.thirdLB.alpha = 0.5
                    
                }else {
                    sender.isSelected = true
                    self.thirdLB.alpha = 1.0
                }
            case 3:
                if sender.isSelected {
                    sender.isSelected = false
                    self.fourthLB.alpha = 0.5
                    
                }else {
                    sender.isSelected = true
                    self.fourthLB.alpha = 1.0
                }
            case 4:
                if sender.isSelected {
                    sender.isSelected = false
                    self.fifthLB.alpha = 0.5
                    
                }else {
                    sender.isSelected = true
                    self.fifthLB.alpha = 1.0
                }
            default:
                print("error")
            }
        }
        
    }
    
    @objc func bottomButtonClicked(_ sender: UIButton) {
        let tagNum = sender.tag
        UIView.animate(withDuration: 0.3) { 
            if tagNum == 0 {
                self.listButton.isSelected = true
                self.clockButton.isSelected = false
                self.bellButton.isSelected = false
                self.userButton.isSelected = false
                self.bottomBar.frame.origin.x = 0
            }else if tagNum == 1 {
                self.listButton.isSelected = false
                self.clockButton.isSelected = true
                self.bellButton.isSelected = false
                self.userButton.isSelected = false
                self.bottomBar.frame.origin.x = 75
            }else if tagNum == 2 {
                self.listButton.isSelected = false
                self.clockButton.isSelected = false
                self.bellButton.isSelected = true
                self.userButton.isSelected = false
                self.bottomBar.frame.origin.x = 225
            }else {
                self.listButton.isSelected = false
                self.clockButton.isSelected = false
                self.bellButton.isSelected = false
                self.userButton.isSelected = true
                self.bottomBar.frame.origin.x = 300
            }
        }
    }
    
    
    @objc func plusBtnClicked(_ sender: UIButton) {
        if plusBtn.isSelected {
            UIView.animate(withDuration: 0.5, animations: {
                self.settingBtn.frame.origin.x += 80
                self.settingBtn.frame.origin.y += 30
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    self.infoBtn.frame.origin.y += 75
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.contentsBtn.frame.origin.x -= 80
                        self.contentsBtn.frame.origin.y += 30
                    }, completion: { _ in
                        self.settingBtn.isHidden = true
                        self.infoBtn.isHidden = true
                        self.contentsBtn.isHidden = true
                    })
                })
            })
            sender.isSelected = false
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.settingBtn.isHidden = false
                self.settingBtn.frame.origin.x -= 80
                self.settingBtn.frame.origin.y -= 30
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    self.infoBtn.isHidden = false
                    self.infoBtn.frame.origin.y -= 75
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.contentsBtn.isHidden = false
                        self.contentsBtn.frame.origin.x += 80
                        self.contentsBtn.frame.origin.y -= 30
                    })
                })
            })
            sender.isSelected = true
        }
    }

}
