# CountdownLabel

- 해커톤에서 일정 시간을 countdown을 하기 위해 countdownLabel 오픈소스를 사용

### 코드

```swift
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
```

### 실행 화면

<img src="https://simajune.github.io/img/posting/CountdownLabel1.gif" width="414px" height="758px"/>



