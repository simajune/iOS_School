# UIControl

### 1. UIControl이란

- 유저의 특정 동작을 통해 시각적인 요소를 특정 액션이나 의도에 맞게 전달하는 기본적인 클래스




### 2. UIControl 개요

- 버튼이나 슬라이더와 같은 컨트롤 구현 요소는 탐색을 용이하고 유저의 입력을 다루고 컨텐츠를 다루는데 사용된다.
- UIControl은 바로 클래스의 인스턴스로 만들수 없고 UIControl의 하위 클래스를 통해 만들수 있다. 하위 클래스에는 UIButton, UISlider, UISwitch, UITextField가 있다.



### 3. UIControl의 Target-Action Mechanism

- 컨트롤의 액션은 코드로 설정을 할 수 있다. 코드롤 설정하는 방법은 두가지이다. 하나는 UIControl의 주요 메소드인 addTarget(_:action:for:)를 사용하는 것이고 다른 하나는 UIEvent인 @IBAction을 이용한 메소드를 추가하는 것이다.

  1. addTarget(_:action:for:)

     ```swift
     class ViewController: UIViewController {
         
         override func viewDidLoad() {
             super.viewDidLoad()
             //버튼 생성 및 설정
             let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
             btn.setTitle("버튼", for: .normal)
             btn.backgroundColor = .red
             btn.setTitleColor(.green, for: .normal)
             btn.addTarget(self,
                           action:#selector(ViewController.btnAction(sender:)),
                           for: .touchUpInside)
             self.view.addSubview(btn)   
         }
         
         func btnAction(sender:UIButton) {
             //버튼 이벤트시 액션
         }    
     }
     ```

  2. @IBAction

     ```swift
     class ViewController: UIViewController {
         
         override func viewDidLoad() {
             super.viewDidLoad()
         }
         
         @IBAction func doSomething(sender: UIButton) {
             //버튼 이벤트시 액션
         }   
     }
     ```



### 4. UIControl 주요항목

```swift
//UIControl의 상태
public static var normal: UIControlState { get }
public static var highlighted: UIControlState { get }
public static var disabled: UIControlState { get }
public static var selected: UIControlState { get }
//UIControl의 프로퍼티
open var isEnabled: Bool
open var isSelected: Bool
//UICointrol의 메소드
open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
```

