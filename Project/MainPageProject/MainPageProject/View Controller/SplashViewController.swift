
import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var isLogin = UserDefaults.standard.bool(forKey: "isLogined")
    var autoLogin = UserDefaults.standard.bool(forKey: "autoLogin")
    var loadingTime = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isLogin && autoLogin{
            showMain()
        }else {
            isLogin = false
            showLogin()
        }
//        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: false)
        
    }
    
//    @objc func countDown () {
//        if loadingTime > 0 {
//            loadingTime -= 1
//        }else if loadingTime == 0 {
//            if isLogin && autoLogin{
//                showMain()
//            }else {
//                isLogin = false
//                showLogin()
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingIndicator.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        loadingIndicator.stopAnimating()
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
