
import UIKit
import CountdownLabel

class ViewController: UIViewController {

    @IBOutlet weak var CustomLb: CountdownLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setCountDown(){
        CustomLb.setCountDownTime(minutes: 40)
        CustomLb.timeFormat = "mm:ss"
        CustomLb.start()
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        print("\(CustomLb.timeRemaining)")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        setCountDown()
    }
}

extension ViewController: CountdownLabelDelegate{
    func countdownFinished() {
        
    }
    
    func countdownPaused() {
        
    }
    
}
