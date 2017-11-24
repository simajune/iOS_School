import UIKit
import Firebase
//height = 0.06%
// width = 0.7 %


class SignupViewController: UIViewController {
    
    //MARK: - Property
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "backwhite"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let loginScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .lightGray
//        sv.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        image.image = UIImage(named: "Login Screen")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let accounId: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .clear
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.attributedPlaceholder = NSAttributedString(string: "  E-Mail",
                                                      attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, ])
        tf.textColor = .white
        return tf
    }()
    
    let accountPw: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .clear
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "  PassWord",
                                                      attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, ])
        tf.textColor = .white
        return tf
    }()
    
    let accountCheckPw: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .clear
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "  Check Pass Word",
                                                      attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray])
        tf.textColor = .white
        return tf
    }()
    
    let CreateAccountBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Confirm", for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(loginScrollView)
        loginScrollView.addSubview(contentView)
        contentView.addSubview(contentBackground)
        
        contentBackground.addSubview(accounId)
        contentBackground.addSubview(accountPw)
        contentBackground.addSubview(accountCheckPw)
        contentBackground.addSubview(CreateAccountBtn)
        contentBackground.addSubview(backBtn)
        
        autoScrollView()
        autoContentView()
        
        
        self.setLayoutMultiplier(target: accounId,
                                 centerXMultiplier: 1.0,
                                 centerYMultiplier: 0.8,
                                 widthMultiplier: 0.7,
                                 heightMultiplier: 0.06)
        
        self.setLayoutMultiplier(target: accountPw,
                                 centerXMultiplier: 1.0,
                                 centerYMultiplier: 1,
                                 widthMultiplier: 0.7,
                                 heightMultiplier: 0.06)
        
        self.setLayoutMultiplier(target: accountCheckPw,
                                 centerXMultiplier: 1.0,
                                 centerYMultiplier: 1.2,
                                 widthMultiplier: 0.7,
                                 heightMultiplier: 0.06)
        
        self.setLayoutMultiplier(target: CreateAccountBtn,
                                 centerXMultiplier: 1.0,
                                 centerYMultiplier: 1.6,
                                 widthMultiplier: 0.7,
                                 heightMultiplier: 0.06)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidShow(noti:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(noti:)),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
        CreateAccountBtn.addTarget(self,
                                   action: #selector(CreateAccountBtnAction(_:)),
                                   for: .touchUpInside)
        
        backBtn.addTarget(self,
                          action: #selector(self.backBtnAction(_:)),
                          for: .touchUpInside)
        
    }
    
    @objc func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - KeyboardWillHide
    @objc func keyboardWillHide(noti: Notification) {
        loginScrollView.contentInset = UIEdgeInsets.zero
    }
    //MARK: - KeyboardDidShow
    @objc func keyboardDidShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
        loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyFrame.height, right: 0)
    }
    
    func autoScrollView() {
        loginScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func autoContentView() {
        self.contentView.centerXAnchor.constraint(equalTo: self.loginScrollView.centerXAnchor).isActive = true
        self.contentView.centerYAnchor.constraint(equalTo: self.loginScrollView.centerYAnchor).isActive = true
        self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        self.contentBackground.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.contentBackground.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.contentBackground.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.contentBackground.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        
        
        self.backBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        self.backBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.backBtn.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.backBtn.widthAnchor.constraint(equalTo: backBtn.heightAnchor).isActive = true
    }
    
    @objc func CreateAccountBtnAction(_ sender: UIButton) {
        
        guard let id = accounId.text else {return}
        guard let pw = accountPw.text else {return}
        guard let checkPw = accountCheckPw.text else {return}
        
        if pw != checkPw {
            print("print 비밀번호가 일치하지 않습니다")
        }else {
            Auth.auth().createUser(withEmail: id, password: pw, completion: { (user, error) in
                if error == nil && user != nil {
                    
                    //defaultProfileImgURL
                    let defaultphoID = "https://firebasestorage.googleapis.com/v0/b/fcinstagram-8876c.appspot.com/o/profile_images%2FdefaultphotoID.png?alt=media&token=966cffd6-75ec-4e8f-ab43-492c36bb9210"
                    //save UserData
                    InstaDatabase.main.saveUserData(username: id, userProfilephotoID: defaultphoID)
                    
                    //login success alert
                    let alertSheet = UIAlertController(title: "성공", message: "회원가입이 완료되었습니다.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                        let mainVC = CustomTabbarViewController()
                        self.present(mainVC, animated: true, completion: nil)
                    })
                    alertSheet.addAction(okAction)
                    self.present(alertSheet, animated: true, completion: nil)
                    
                }else {
                    // firebase 에서 제공하는 에러 string
                    print(error!.localizedDescription)
                }
            })
        }
    }
    
}


extension SignupViewController {
    
    func setLayoutMultiplier(target: AnyObject,
                             centerXMultiplier: CGFloat,
                             centerYMultiplier: CGFloat,
                             widthMultiplier: CGFloat,
                             heightMultiplier: CGFloat) {
        
        let targetTFCenterX = NSLayoutConstraint(item: target,
                                                 attribute: NSLayoutAttribute.centerX,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: self.view,
                                                 attribute: NSLayoutAttribute.centerX,
                                                 multiplier: centerXMultiplier,
                                                 constant: 0)
        
        let targetTFCenterY = NSLayoutConstraint(item: target,
                                                 attribute: NSLayoutAttribute.centerY,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: self.view,
                                                 attribute: NSLayoutAttribute.centerY,
                                                 multiplier: centerYMultiplier,
                                                 constant: 0)
        
        let targetTFWidth = NSLayoutConstraint(item: target,
                                               attribute: NSLayoutAttribute.width,
                                               relatedBy: NSLayoutRelation.equal,
                                               toItem: self.view,
                                               attribute: NSLayoutAttribute.width,
                                               multiplier: widthMultiplier,
                                               constant: 0)
        
        let targetTFHeight = NSLayoutConstraint(item: target,
                                                attribute: NSLayoutAttribute.height,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: self.view,
                                                attribute: NSLayoutAttribute.height,
                                                multiplier: heightMultiplier,
                                                constant: 0)
        
        self.view.addConstraint(targetTFCenterX)
        self.view.addConstraint(targetTFCenterY)
        self.view.addConstraint(targetTFWidth)
        self.view.addConstraint(targetTFHeight)
    }
}

