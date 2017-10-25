
import UIKit

class SplashViewController: UIViewController {
    
    var isLogin = UserDefaults.standard.bool(forKey: "isLogined")
    var AutoLogin = UserDefaults.standard.bool(forKey: "autoLogin")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //isLogin = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isLogin {
            showMain()
        }else {
            isLogin = false
            showLogin()
        }
    }
    
    func showLogin() {
        let loginVC = UIStoryboard(name: "LoginFlow", bundle: nil)
        if let loginView = loginVC.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController {
            self.present(loginView, animated: true, completion: nil)
        }
    }
    
    func showMain() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil)
        if let mainView = mainVC.instantiateViewController(withIdentifier: "mainNavi") as? UINavigationController {
            self.present(mainView, animated: true, completion: nil)
        }
    }
    
}
