//
//  ViewController.swift
//  171011_KakaoClone
//
//  Created by SIMA on 2017. 10. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var inputTextView: UITextView!
    var chatData: NSMutableArray! = ["Hi",
                                     "Oh!, hi. long long long long long long long long long time no see"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //키보드 노티피케이션
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        chatTableView.rowHeight = UITableViewAutomaticDimension
        
        inputTextView.delegate = self
    }
    
    @IBAction func textInputDone(_ sender: Any) {
        
        if inputTextView.hasText {
                chatData.add(inputTextView.text)
            chatTableView.reloadData()
            inputTextView.text = ""
            
            let lastIndexPath = NSIndexPath(row: chatData.count - 1, section: 0) as IndexPath
            
            self.view.layoutIfNeeded()
            
            chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: false)
            self.textViewDidChange(inputTextView)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.contentSize.height <= 83 {
            textViewHeight.constant = textView.contentSize.height
            textView.setContentOffset(CGPoint.zero, animated: false)
        }
        
        
        self.view.layoutIfNeeded()
    }
    
    
    
    
    @objc func keyboardWillShow(noti: Notification) {
        //키보드의 높이를 가져오는 작업
        let notiInfo = noti.userInfo! as NSDictionary
        let keyboardFrame = notiInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height
        
        inputViewBottomMargin.constant = -height
        //애니메이션 추가
        //키보드의 애니메이션 속도 가져와야 함
        let animationDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notiInfo = noti.userInfo! as NSDictionary
        
        inputViewBottomMargin.constant = 0
        let animationDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = tableView.dequeueReusableCell(withIdentifier: "MyBubbleTableViewCell", for: indexPath) as! MyBubbleTableViewCell
        let yourcell = tableView.dequeueReusableCell(withIdentifier: "YourBubbleTableViewCell", for: indexPath) as! YourBubbleTableViewCell
        
        if indexPath.row % 2 == 0 {
            mycell.myBubbleText.text = chatData[indexPath.row] as? String
            mycell.selectionStyle = UITableViewCellSelectionStyle.none
            return mycell
        }else {
            yourcell.yourBubbleText.text = chatData[indexPath.row] as? String
            yourcell.selectionStyle = UITableViewCellSelectionStyle.none
            return yourcell
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

