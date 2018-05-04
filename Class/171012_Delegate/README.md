# Protocol & Delegate

### 1. Protocol

- 프로토콜은 원하는 작업이나 기능을 구현되도록 메소드, 프로퍼티 등으로 요구 사항의 청사진을 정의한다.
- 클래스, 구조체, 열거형은 프로토콜을 채택하면 프로토콜에서 요구한 사항에 대해 구현해야 된다.
- 프로토콜을 통해 공통적인 작업을 강제할 수 있으며 해당 프로토콜을 채택한 사람이 구현한 메소드에 대한 정보도 알 수 있다.



### 2. Protocol 문법

```swift
protocol Runable {
	var regCount:Int {get set}
	func run()
}

class Animal: Runable{
	var regCount:Int = 0
	func run()
	{
	}
}
```

- 위에 코드는 Runable이란 프로토콜을 정의하고 Animal이란 클래스에서 Runable이란 프로토콜을 채택한 코드이다. 
- Runable이란 프로토콜에서 regCount란 프로퍼티와 run()이란 메소드를 정의를 했기 때문에 Runable을 프로토콜로 채택한 Animal클래스에서는 regCount와 run()을 무조건 구현을 해야한다.



### 3. 프로토콜의 프로토콜 채택

- 프로토콜이 프로토콜을 채택을 하면 채택한 프로토콜에서는 채택된 프로토콜에서 정의된 프로퍼티나 메소드를 구현하지 않는다. 하지만 프로토콜을 채택한 것이 클래스인 경우에는  구현을 해야 한다. 그리고 채택된 프로토콜에 정의된 모든 것을 구현을 해야한다.

  ```swift
  protocol Runable {
  	var regCount:Int {get set}
  	func run()
  }
  protocol Flying :Runable {
  	var wingCount:Int {get set}
  }
  class Animal: Flying{
  	var wingCount: Int = 0
  	var regCount:Int = 0
  	func run()
  	{
  	}
  }
  ```

- 위에 코드를 보면 Runable이란 프로토콜을 채택한 Flying 프로토콜은 Runable에 정의 된 프로퍼티나 메소드는 구현을 할 필요는 없지만 Flying 프로토콜을 채택한 Animal 클래스는 Flying의 정의된 것 뿐만 아니라 Flying에서 채택한 Runable의 프로퍼티와 메소드 모두 다 구현을 해야한다.



### 4. 추상클래스의 Protocol

- 프로토콜을 추상 클래스처럼 사용할 수 있다.

- 다음과 같이 클래스가 있고 racing이라는 함수를 구현하려고 한다면 아래와 같이 구현한다.

  ```swift
  class Dog: Runable{
  	//...
  }
  class Horse: Runable{
  	//...
  }
  func racing(animals:[Runable]) -> Runable
  {
  }
  ```

- 프로토콜타입으로 사용가능하다.

  ```swift
  let winner:Runable = racing(animals: [Dog(),Horse()])
  ```



### 5. Delegate

- 델리게이트는 클래스나 구조체에서의 일부분의 할 일을 다른 인스턴스에게 대신하게 하는 디자인 패턴
- 뷰가 받은 이벤트나 상태를 ViewController에게 전달해주기 위해 주로 사용된다. (예, UIScrollViewDelegate)
- ViewController를 통해 View구성에 필요한 데이터를 받는 용도로도 사용 (예, UITableViewDataSource)



-  **Delegate 선언부**

  ```swift
  class CustomView: UIView {
      //2번
  	var delegate:CustomViewDelegate?
  	override func layoutSubviews() {
          //3번
  		delegate?.viewFrameChanged(newFrame:self.frame)
  	}
  }
  //1번
  protocol CustomViewDelegate {
  	func viewFrameChanged(newFrame:CGRect)
  }
  ```

  1. CustomView Delegate 채택
  2. 채택한 Delegate 메소드 구현
  3. Custom instance의 delegate 프로퍼티에 자기 자신의 인스턴스를 할당(프로토콜 추상화 타입)
     - ViewController입장에선 구현한 메소드를 실행하진 않지만 customView가 적절한 곳에서 호출했을 것이다.
     - customView가 특정 위치에서 해당 메소드를 호촐할 것을 예상하여 필요한 행동을 구현한다.

- Delegate 구현부

  ```swift
  //1번
  class ViewController: UIViewController, CustomViewDelegate{
  	override func viewDidLoad() {
  	super.viewDidLoad()
  	let custom = CustomView()
  	//3번
      custom.delegate = self
  }
      //2번
  	func viewFrameChanged(newFrame: CGRect) {
  		//뷰의 프레임이 변경될때마다 불림
  	}
  }
  ```

  1. 프로토콜 생성
  2. 클래스에 delegate 프로퍼티 생성
     - 일반적으로 delegate란 이름 사용
     - 타입은 프로토콜 추상화 타입
  3. delegate 인스턴스의 메소드 실행
     - 현재 customView입장에선 delegate instance가 존재하는지는 모른다.
     - 하지만 만약 어떤 instance가 delegate instance값을 할당을 해했다면 분명 A는 나의 프로토콜 채택을 했고 메소드를 구현했다는 것을 인지
     - delegate method를 사용해서 메소드 실행 및 리턴 값을 받아와 사용