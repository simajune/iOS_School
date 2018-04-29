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




### 4. UIVIewController 종류

- General View Controller
  - UIViewController
  - UITableViewController
  - UICollectionViewController
- Container View Controller
  - UINavigationController
  - UITabbarController
  - UISplitViewController



#### General View Controller

- 일반적인 ViewController 형태
- 각 ViewController가 Root View를 가지고 있다.
  - UIViewController의 Root View는 UIView
  - UITableViewController의 Root View는 UITableView
  - UICollectionViewController의 Root View는 UICollectionView



### 5. UIViewController Instance 생성

- UIViewController의 Instance를 생성하는 방법

  1. 일반적인 초기화 메소드를 활용한 instance 생성

     let vc: UIViewController = UIViewController()

  2. xib파일이 Storyboard에 있을 때, Storyboard를 통한 instance 생성방법

     let storyboard = UIStoryborad(name: "스토리보드 이름", bundle: nil)

     let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "스토리보드 ID")



### 6. UIViewController간 화면 전환

- 현재 UIViewController에서 새로운 화면으로 전환을 위해 ViewController는 화면전환을 해야한다.
- UIViewController의 화면전환 방법은 크게 3가지가 존재한다.
  - Present Modally
  - UINavigationController
  - UITabbarController
- Storyboard내에서의 화면전환에는 Segue Instance를 사용해서 직관적으로 ViewController간의 관계를 보여준다.



#### Present Modally

- 일번적인 화면전환을 위한 방법

- 기준 ViewController에서 대상 ViewController를 Present한다.(일반적으로 기준 ViewController가 대상 ViewController Instance를 생성한다.)

- 화면이 전환되어도 기준 ViewController가 메모리에 존재하며, 대상 ViewController 를 되돌아 갈 때 메모리에서 제거된다.

- 다음 두 메소드를 사용해서 화면전환과 되돌아오기가 가능하다.

  ```swift
  present(UIViewController, animated: Bool, completion: (() -> Void)?)
  //화면전환
  dismiss(animated: Bool, completion: (() -> Void)?
  //되돌아오기
  ```

- present ( 기준 ViewController Method내부)

  ```swift
  func goToNextVC() {
  	//다음 인스턴스 생성
  	let storyboard = UIStoryboard(name: “Storyboard이름”, bundle: nil)
  	let nextVC = storyboard.instantiateViewController(withIdentifier: “NextViewController”) as! NextViewController
  	//present
  	self.present(nextVC, animated: true) {
  	//컴플리션 클로져 내부
  	}
  }
  ```

- dismiss (대상 ViewController Method 내부)

  ```swift
  func backVC() {
      //되돌아 가기
  	dismiss(animated: true, completion: nil)
  }
  ```

  ​






