
import UIKit
import Firebase

enum firebaseError : String{
    case alreadyEmail = "The email address is already in use by another account."
    case badlyFormatEmail = "The email address is badly formatted."
    case passwordError = "The password must be 6 characters long or more."

    var ErrorStr: String {
        switch self {
        case .alreadyEmail:
            return "이미 존재하는 메일입니다."
        case .badlyFormatEmail:
            return "잘못된 이메일 형식입니다."
        case .passwordError:
            return "비밀번호가 너무 짧습니다."
        }
    }
}

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    private func setupUI() {
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.white.cgColor
    }

    @objc func keyboardWillShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let _ = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signupButton(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let repassword = rePasswordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        
        if password != repassword {
            wrongSignup()
        }else {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if error == nil && user != nil {
                    print("User Created")

                    let userDic = ["username": username, "email": email]
                    Database.database().reference().child("user").child(user!.uid).setValue(userDic)
                    
                    let alertSheet = UIAlertController(title: "가입 완료", message: "가입이 성공적으로\n이루어졌습니다", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                        let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        if let mainVC = mainstoryBoard.instantiateViewController(withIdentifier: "MainNavi") as? UINavigationController {
                            self.present(mainVC, animated: true, completion: nil)
                        }
                    })
                    alertSheet.addAction(okAction)
                    self.present(alertSheet, animated: true, completion: nil)
                }else {
                    let firebaseErrorMsg = error!.localizedDescription
                    let errorMsg = firebaseError(rawValue: firebaseErrorMsg)?.ErrorStr
                    let alertSheet = UIAlertController(title: "경고", message: errorMsg, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alertSheet.addAction(okAction)
                    self.present(alertSheet, animated: true, completion: nil)
                    
                }
            })
        }
        
    }
    
    func wrongSignup() {
        let alertSheet = UIAlertController(title: "비밀번호 오류", message: "비밀번호가 동일하지 않습니다.", preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertSheet.addAction(OkAction)
        present(alertSheet, animated: true, completion: nil)
    }
    
}
