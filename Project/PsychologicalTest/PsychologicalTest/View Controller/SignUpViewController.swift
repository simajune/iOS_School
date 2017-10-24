
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameText: CustomTextField!
    @IBOutlet weak var emailText: CustomTextField!
    @IBOutlet weak var passwordText: CustomTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameText.leftView = UIImageView(image: #imageLiteral(resourceName: "User"))
        userNameText.leftViewMode = .always
        userNameText.configureAttributedString(string: "아이디를 입력하세요", range: NSRange(location:0, length: 3), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        emailText.leftView = UIImageView(image: #imageLiteral(resourceName: "email"))
        emailText.leftViewMode = .always
        emailText.configureAttributedString(string: "이메일을 입력하세요", range: NSRange(location: 0, length: 3), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        passwordText.leftView = UIImageView(image: #imageLiteral(resourceName: "Password"))
        passwordText.leftViewMode = .always
        passwordText.configureAttributedString(string: "패스워드를 입력하세요", range: NSRange(location: 0, length: 4), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)), name: .UIKeyboardWillHide, object: nil)
        
        
        
    }
    
    @objc func keyboardWillShow (noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0)
    }
    
    @objc func keyboardWillHide (noti: Notification) {
        //guard let userInfo = noti.userInfo else { return }
        //guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    
}
