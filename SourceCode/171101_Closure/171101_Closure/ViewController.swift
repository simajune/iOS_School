
import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    

    @IBOutlet weak var delegateLb: UILabel!
    @IBOutlet weak var closureLb: UILabel!
    @IBOutlet weak var customView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        //파라미터를 customView로 만들었을 때
        customView.closureButton = { (customView) -> Void in
            self.closureLb.text = customView.customLb.text
        }
        
        customView.closureButton = { self.closureLb.text = $0.customLb.text }
        
        //파라미터를 String으로 받았을 때
//        customView.closureButton = { (string: String) -> Void in
//            self.closureLb.text = string
//        }
        (0...10).filter { $0 % 2 == 0 }
        
    }

    
    
    
    func selectedView(_ customView: CustomView) {
        delegateLb.text = customView.customLb.text
    }
    
    
}

