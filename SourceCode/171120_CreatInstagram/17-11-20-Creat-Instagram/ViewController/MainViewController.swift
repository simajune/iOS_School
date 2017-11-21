
import UIKit
import Firebase


class MainViewController: UIViewController {

//    let ref: DatabaseReference!
    
    
    var successLable: UILabel = {
        let lb = UILabel()
        lb.text = "로그인이 정상적으로 완료되었습니다."
        lb.frame = CGRect(x: 150, y: 300, width: 100, height: 100)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(successLable)
        
        
    }

}
