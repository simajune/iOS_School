import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  
  var emailTF: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "이메일 입력해주세요"
    return textField
  }()
  
  var passwordTF: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "비밀번호를 입력해주세요"
    
    textField.isSecureTextEntry = true
    return textField
  }()
  
  var loginBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("로그인", for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.1849034429, green: 0.3043515086, blue: 0.4955952168, alpha: 1)
    btn.layer.cornerRadius = 5
    return btn
  }()
  
  var signUpBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("회원가입", for: .normal)
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
    logo.constraint(targetView: scrollView, topConstant: 20, bottomConstant: -400, leftConstant: 100, rightConstant: -100)
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stackView)
    stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
    stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
    stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100).isActive = true
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    
    stackView.addArrangedSubview(emailTF)
    stackView.addArrangedSubview(passwordTF)
    stackView.addArrangedSubview(loginBtn)
    stackView.addArrangedSubview(signUpBtn)
    
    reference = Database.database().reference()
    
    loginBtn.addTarget(self, action: #selector(logIn(_:)), for: .touchUpInside)
    
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
  }
  
  @objc func logIn(_ sender: UIButton)
  {
    guard let account = emailTF.text, !account.isEmpty else { return }
    guard let pwd = passwordTF.text, !pwd.isEmpty else { return }
    Auth.auth().signIn(withEmail: account, password: pwd) { (user, error) in
      if error == nil && user != nil{
        let nextVC  = MainViewController()
        self.present(nextVC, animated: true, completion: nil)
      }
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





