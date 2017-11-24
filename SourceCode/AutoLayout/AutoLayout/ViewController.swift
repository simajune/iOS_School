
import UIKit

class ViewController: UIViewController {

    
    var btn: UIButton = {
        let button = UIButton()
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(btn)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

