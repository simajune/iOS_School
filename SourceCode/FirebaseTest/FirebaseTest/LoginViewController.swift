//
//  LoginViewController.swift
//  FirebaseTest
//
//  Created by SIMA on 2017. 11. 7..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        //noti를 이용해서 addObserver를 통해 키보드의 상태를 체크
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
    }
    //키보드 올라 왔을 때의 Inset을 통해 스크롤 뷰의 사이즈 조정
    @objc func keyboardWillShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
    }
    //키보드 내려갈 때의 Inset을 통해 스크롤 뷰 사이즈 조정
    @objc func keyboardWillHide(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard (userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect) != nil else{ return }
        
        scrollView.contentInset = UIEdgeInsets.zero
    }
    //뷰의 모양을 담당하는 메소드
    func setupView() {
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        
        signupButton.layer.borderColor = UIColor.white.cgColor
        signupButton.layer.borderWidth = 1
        signupButton.layer.cornerRadius = signupButton.frame.height / 2
        
    }
    

}
