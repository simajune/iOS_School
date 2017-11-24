import UIKit
import Firebase

class SignInViewController: UIViewController {

  
  var emailTF: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "이메일 입력해주세요"
    textField.autocapitalizationType = .none
    return textField
  }()
 
  var passwordTF: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "비밀번호를 입력해주세요"
    
    textField.isSecureTextEntry = true
    return textField
  }()
  
  var rePasswordTF: UITextField = {
    let textField = UITextField()
    textField.placeholder = "다시 비밀번호를 입력해주세요"
    textField.borderStyle = .roundedRect
    textField.isSecureTextEntry = true
    return textField
  }()

  var signUpBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("회원가입", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.1411764706, green: 0.231372549, blue: 0.4196078431, alpha: 1), for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.5764705882, green: 1, blue: 0.8745098039, alpha: 1)
    btn.layer.cornerRadius = 5
    return btn
  }()
  
  var logo: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "logo.png")
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  var scrollView: UIScrollView = {
    let screensize: CGRect = UIScreen.main.bounds
    let screenWidth = screensize.width
    let screenHeight = screensize.height
    var scrollView = UIScrollView()
    scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight * 2)
    return scrollView
  }()
  
  var contentView: UIView = {
    let screensize: CGRect = UIScreen.main.bounds
    let screenWidth = screensize.width
    let screenHeight = screensize.height
    var view = UIView()
//    view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 2))
    return view
  }()
  
  var reference : DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    
    self.view.addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.constraint(targetView: view, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    scrollView.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    contentView.constraint(targetView: scrollView, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    
    contentView.addSubview(logo)
    logo.constraint(targetView: contentView, topConstant: 20, bottomConstant: -350, leftConstant: 80, rightConstant: -80)
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stackView)
    stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
    stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
    stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
    stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100).isActive = true
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
   
    stackView.addArrangedSubview(emailTF)
    stackView.addArrangedSubview(passwordTF)
    stackView.addArrangedSubview(rePasswordTF)
//    stackView.addArrangedSubview(loginBtn)
    stackView.addArrangedSubview(signUpBtn)
    
    reference = Database.database().reference()
    
    signUpBtn.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
  
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
  }
  
  @objc func signUp(_ sender: UIButton)
  {
    print("왜안눌려")
    guard let account = emailTF.text, !account.isEmpty else { return }
    guard let pwd = passwordTF.text, !pwd.isEmpty else { return }
    guard let rePwd = rePasswordTF.text, !rePwd.isEmpty else { return }
    
    if pwd != rePwd
    {
      print("틀려요")
    }else{
      Auth.auth().createUser(withEmail: account, password: pwd, completion: {[weak self] (user, error) in
        guard let `self` = self else { return }
        if error == nil && user != nil{
            let userDic: [String: Any] = ["user": account, "profileImgUrl": "https://firebasestorage.googleapis.com/v0/b/fcinstagram-8876c.appspot.com/o/profile_images%2FblackHearts.png?alt=media&token=6496d485-1420-4786-bc0e-c613b02c4233"]
          self.reference.child(user!.uid).setValue(userDic)

          let nextVC = CustomTabbarViewController()
          self.present(nextVC, animated: true, completion: nil)
        }
      })
    }
  }
  
  @objc func keyboardWillShow(noti: Notification) {
    guard let userInfo = noti.userInfo else { return }
    guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
    
  }
  
  @objc func keyboardWillHide(noti: Notification) {
    scrollView.contentInset = UIEdgeInsets.zero
  }

}


//extension UIView
//{
//  // MARK: constraint메소드
//  func constraint(targetView: UIView, topConstant: CGFloat?, bottomConstant: CGFloat?, leftConstant: CGFloat?, rightConstant: CGFloat? )
//  {
//    self.translatesAutoresizingMaskIntoConstraints = false
//    // 오토레이아웃 적용
//    
//    if let constant = topConstant{
//      self.topAnchor.constraint(equalTo: targetView.topAnchor, constant: constant).isActive = true
//    }
//    if let constant = rightConstant{
//      self.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: constant).isActive = true
//    }
//    if let constant = bottomConstant{
//      self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: constant).isActive = true
//    }
//    if let constant = leftConstant{
//      self.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: constant).isActive = true
//    }
//  }
//}

