
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "User"))
        userNameTextField.leftViewMode = .always
        userNameTextField.configureAttributedString(string: "아이디를 입력해주세요.", range: NSRange(location:0, length: 3) , stringColor: UIColor.red.withAlphaComponent(0.5))
        
        passwordTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "Password"))
        passwordTextField.leftViewMode = .always
        passwordTextField.configureAttributedString(string: "패스워드를 입력해주세요.", range: NSRange(location: 0, length: 4), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        scrollView.bounces = false
        
    }
    
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else{ return }
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard (userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect) != nil else{ return }
        
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @IBAction func didTapLoginButton(_ sender: RoundButton) {
        guard let username = userNameTextField.text, !username.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        if UserService.sharedInstance.validateUserInfo(username: username, password: password) {
            UserDefaults.standard.set(true, forKey: "isLogined")
            UserDefaults.standard.set(true, forKey: "autoLogin")
            let goMainVC = UIStoryboard(name: "Main", bundle: nil)
            if let MainVC = goMainVC.instantiateViewController(withIdentifier: "SplashView") as? UIViewController {
                self.present(MainVC, animated: true, completion: nil)
            }
        }else {
            userNameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
        
        
    }
    

}

