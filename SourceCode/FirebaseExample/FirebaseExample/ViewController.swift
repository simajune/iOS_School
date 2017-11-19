
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var deleteTextField: UITextField!
    @IBOutlet weak var selectTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        
        ref.observe(.childAdded) { (dataSnapshot) in
            print("ItemAdd")
            dump(dataSnapshot)
        }
        
        ref.observe(.childRemoved) { (snapshot) in
            print("ItemDelete")
            dump(snapshot)
        }
    }

    @IBAction func insertHandler(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let value = valueTextField.text else { return }
        
        let itemRef = ref.child((nameTextField.text?.lowercased())!)
        
        itemRef.setValue(valueTextField.text)
        nameTextField.text = ""
        valueTextField.text = ""
    }
    
    @IBAction func deleteHandler(_ sender: UIButton) {
        let itemRef = ref.child((deleteTextField.text?.lowercased())!)
        itemRef.removeValue()
        
       
    }
    
    @IBAction func selectHandler(_ sender: UIButton) {
        ref.child((selectTextField.text?.lowercased())!).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? String
            let name = value
        }
        
    }
    
}

