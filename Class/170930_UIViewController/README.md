# UIViewController

### 1. UIViewController

- 앱의 기초가 되는 내부 구조
- 모든 앱은 적어도 한개 이상의 ViewController를 가지고 있고 대부분의 앱은 여러개의 ViewController로 이루어져 있다.
- ViewController는 사용자의 인터렉션과 앱의 데이터 사이에서 컨트롤 역할을 한다.
- ViewController는 View관리, 사용자 이벤트 핸들링, ViewController간의 전환 등을 위한 메소드와 프로퍼티를 가지고 있다.




### 2. Root View

​	<img src="https://simajune.github.io/img/posting/UIViewController1.png" width="600px" height="400px"/>

- View의 계층을 관리하는 기능
- 모든 뷰컨트롤러는 한개의 RootView를 가지고 있다.
- 화면에 표시하기 위해서는 모든 뷰는 RootView의 계층 안에 있어야 한다.



### 3. ViewController 특징

- Child UIViewController
- UserInteraction
- Data Marshaling(중계자)
- Resource Management

------

#### ㄱ. Child UIViewController

<img src="https://simajune.github.io/img/posting/UIViewController2.png" width="600px" height="600px"/>

- ViewController는 다른 ViewController를 Child ViewController로 Container의 역할을 수행한다.
- Child ViewController의 Root View를 자신의 Root View에 addSubView하여 표시한다.

#### ㄴ. UserInteraction 

- UIViewController는 UIResponder를 상속받은 클래스로 이벤트 체인으로부터 오는 이벤트는 효과적으로 처리한다.
- 즉 사용자의 모든 이벤트는 ViewController가 받아서 각 View에 해당되는 Method와 Delegate로 처리한다.

#### ㄷ. Data Marshaling(중계자) 

<img src="https://simajune.github.io/img/posting/UIViewController3.png" width="600px" height="400px"/>

- ViewController는 자신이 관리하는 View들과 앱 내부의 데이터와의 중계자 역할을 한다.

#### ㄹ. Resource Management

- ViewController안에 있는 모든 View나 Object는 모두 ViewController의 책임이다.
- 메모리가 부족시 didReceiveMemoryWarning() 메소드가 자동으로 불리며 오랫동안 사용하지 않은 객체와 다시 쉽게 만들 수 있는 객체를 제거할 수 있어 메모리를 효율적으로 관리한다.







