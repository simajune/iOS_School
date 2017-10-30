
import UIKit

class SplashViewController: UIViewController {
    //MARK: - Variable
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var isLogin = UserDefaults.standard.bool(forKey: "isLogined")
    var autoLogin = UserDefaults.standard.bool(forKey: "autoLogin")
    var loadingTime = 2
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(isLogin)
        print(autoLogin)
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
    //MARK: - Method
    func showLogin() {
        let loginVC = UIStoryboard(name: "LoginFlow", bundle: nil)
        if let loginView = loginVC.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController {
            self.present(loginView, animated: true, completion: nil)
        }
    }
    
    func showMain() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil)
        if let mainView = mainVC.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController {
            self.present(mainView, animated: true, completion: nil)
        }
    }
    
}
