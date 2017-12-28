
import UIKit
import Firebase

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
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let id = idTextField.text else { return }
        guard let pw = pwTextField.text else { return }
        Auth.auth().signIn(withEmail: id, password: pw) { (user, error) in
            if error == nil && user != nil {
                print("로그인 성공")
                let alertSheet = UIAlertController(title: "로그인 성공", message: "로그인 성공", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                    let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
                    if let mainVC = mainstoryBoard.instantiateViewController(withIdentifier: "MainNavi") as? UINavigationController {
                        self.present(mainVC, animated: true, completion: nil)
                    }
                })
                alertSheet.addAction(okAction)
                self.present(alertSheet, animated: true, completion: nil)
            }else {
                print(error!.localizedDescription)
            }
        }
    }
}
