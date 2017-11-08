
import UIKit
import Firebase

class SplashViewController: UIViewController {

    
    @IBOutlet weak var titleLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLb.alpha = 0
        UIView.animate(withDuration: 2.5, animations: {
            self.titleLb.alpha = 1
        }) { (action) in
            if let _ = Auth.auth().currentUser {
                self.performSegue(withIdentifier: "ToMain", sender: self)
            }else{
                let loginStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                if let loginVC = loginStoryBoard.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController {
                    self.present(loginVC, animated: true, completion: nil)
                }
            }
            
            
        }
    }


}
