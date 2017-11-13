
import UIKit
import Firebase

class ContentsViewController: UIViewController {

    
    @IBOutlet weak var contentsTextField: UITextField!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let uid = Auth.auth().currentUser!.uid
//        guard let contents = contentsTextField.text else { return }
        ref.child("user").child(uid).observe(.value, with: { (snapshot) in
            print(snapshot)
            if let dic = snapshot.value as? [String: Any] {
                if let name = dic["username"] as? String {
                    print(name)
                }
                
            }
        }, withCancel: nil)
        
        let date = Date()
//        DateFormatter = "yyyy MM dd"
//        print(date)
        
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
    }
    
}
