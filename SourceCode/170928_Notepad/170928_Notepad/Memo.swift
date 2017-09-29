
import UIKit

class Memo: UIViewController, UITextViewDelegate {

    //MARK: - Variable
    @IBOutlet var contentTextView: UITextView!
    var data = [String]()
    var order = Int()
    // Variable_End
    
    //MARK: - Status Bar delete
    override var prefersStatusBarHidden: Bool { return true }
    override func viewDidLoad() {
        super.viewDidLoad()
        data = UserDefaults.standard.object(forKey: "Data") as? [String] ?? [String]()
        order = UserDefaults.standard.object(forKey: "Order") as! Int
        if order >= 0 {
            contentTextView.text = data[order]
        } else {
            contentTextView.text = "..."
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.text == "" {
            contentTextView.text = "Placeholder text ..."
            contentTextView.textColor = UIColor.lightGray
        }
    }

    //MARK: - BtnAction
    @IBAction func saveButton(_ sender: Any) {
        order = UserDefaults.standard.integer(forKey: "Order")
        if order >= 0 {
            
            data.remove(at: order)
            data.insert(contentTextView.text, at: 0)
            UserDefaults.standard.set(data, forKey: "Data")
        } else {
            data.insert(contentTextView.text, at: 0)
            UserDefaults.standard.set(data, forKey: "Data")
        }
    }
}
