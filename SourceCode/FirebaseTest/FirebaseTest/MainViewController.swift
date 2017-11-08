
import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        try! Auth.auth().signOut()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController{
            self.present(loginVC, animated: true, completion: nil)
        }
        
        
        
    }
    
}
