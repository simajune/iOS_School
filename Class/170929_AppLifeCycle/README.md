# Life Cycle(생명주기)

### 1. App Life Cycle(앱 생명주기)란

- App Life Cycle은 앱에서 발생하는 특정 이벤트 (앱이 시작할 때, 앱에 들어갈 때, 앱이 백그라운드로 접근할 때, 앱이 갑자기 죽는 경우, 등 )에 대해 정의를 한 것이다. 

- App Life Cycle iOS 고유의 상태이므로 유저가 임의로 지정을 할 수 없다.

- 앱의 상태를 그림으로 보면 아래와 같다.

  <img src="https://simajune.github.io/img/posting/LifeCycle1.png" width="600px" height="800px"/>

  - Not Running : 샐행되지 않았거나, 시스템에 의해 종료된 상태
  - Inactive : 실행 중이지만 이벤트를 받고 있지 않은 상태
  - Active : 어플리케이션이 실질적으로 활동하고 있는 상태
  - Background : 백그라운드 상태에서 실질적인 동작을 하고 있는 상태
  - Suspended : 백그라운드 상태에서 활동을 멈춘 상태

- 이 상태를 실행하는 곳은 AppDelegate이며 실행하는 메소드는 다음과 같다.

  ```swift
  application:willFinishLaunchingWithOptions:
  //어플리케이션이 최초 실행될 때 호출되는 메소드
  application:didFinishLaunchingWithOptions:
  //어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출.
  applicationDidBecomeActive:
  //어플리케이션이 Active 상태로 전환된 직후 호출.
  applicationWillResignActive:
  어플리케이션이 Inactive 상태로 전환되기 직전 호출
  applicationDidEnterBackground:
  //어플리케이션이 백그라운드 상태로 전환된 직후 호출.
  applicationWillEnterForeground:
  //어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출.
  applicationWillTerminate:
  //어플리케이션이 종료되기 직전에 호출.
  ```



### 2. UIViewController Life Cycle(생명주기)란

- UIViewContoller의 Life Cycle도 App Life Cycle과 마찬가지로 ViewContoller의 상태의 따른 이벤트에 메소드가 호출된다.

- 이 메소드는 오버라이드하는 메소드이므로 꼭 해당 메소드 안에 (super.메소드)를 실행해야만 한다.

- UIViewController의 Life Cycle을 그림으로 나타내면 다음과 같다.

  <img src="https://simajune.github.io/img/posting/LifeCycle2.png" width="600px" height="600px"/>

- Life Cycle의 메소드는 다음과 같다.

  ```swift
  override func loadView()
  //UIViewController의 view가 생성될 때 호출
  override func viewDidLoad()
  //UIViewController가 인스턴스화 된 직후(메모리에 객체가 올라간 직후) 호출 처음 한 번 세팅해 줘야하는 값들을 넣기에 적절
  override func viewWillAppear(_ animated: Bool)
  //view가 화면에 보여지기 직전에 호출 화면이 보여지기 전에 준비할 때 사용. animated 파라미터는 뷰가 애니메이션을 동반하여 보여지게 되는지 시스템에서 전달해주는 불리언 값
  override func viewWillLayoutSubviews()
  //view의 하위뷰들의 레이아웃이 결정되기 직전 호출
  override func viewDidLayoutSubviews()
  //view의 하위뷰들의 레이아웃이 결정된 후 호출. 주로 view의 하위뷰들이 사이즈 조정이 필요할 때 호출
  override func viewDidAppear(_ animated: Bool)
  //view가 화면에 보여진 직후에 호출. 화면이 표시된 이후 애니메이션 등을 보여주고 싶을 때 유용
  override func viewWillAppear(_ animated: Bool)
  //view가 화면에서 사라지기 직전에 호출
  override func viewDidDisappear(_ animated: Bool)
  //view가 화면에서 사라진 직후에 호출
  ```





