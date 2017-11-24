
import Firebase
import UIKit

class SlpashViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    

  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let _ = Auth.auth().currentUser{
      print("current")
      let mainVC = CustomTabbarViewController()
      self.present(mainVC, animated: true, completion: {
        //self.dismiss(animated: true, completion: nil)
      })
    }else {
      let mainVC = LoginViewController()
      self.present(mainVC, animated: true, completion: {
        //self.dismiss(animated: true, completion: nil)
      })
    }
    
  }
}

