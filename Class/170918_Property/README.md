# 프로퍼티

- 프로퍼티는 특정 클래스 , 구조체, 열거형에서 쓰이는 속성이다. 프로퍼티의 종류에는 저장 프로퍼티, 연산 프로퍼티, 타입 프로퍼티가 있다. 

### 1. 저장 프로퍼티

- 가장 기본적인 형태로 클래스와 구조체의 인스턴스의 속성을 나타내는 변수나 상수이다.

- 값을 저장하는 용도로 사용되고 초기값을 설정할 수 있다.

  ```swift
  class Number {
      var num1: Int = 0
      var num2: Int = 0
      init(num1: Int, num2: Int) {
          self.num1 = num1
          self.num2 = num2
      }
    	init() {
      }
  }

  var number: Number = Number(num1: 10, num2: 5)
  ```

  위에 코드를 보면 number라는 인스턴스의 프로퍼티를 생성하는 코드이다. 클래스 내에 num1과 num2가 초기화가 되어 있어서 인스턴스를 생성할 때 초기값을 넣어주지 않아도 number의 인스턴스의 저장 프로퍼티는 초기값이 설정이 되도 만약  맨 아래 코드처럼 초기화할 때 값을 넣어주면 인스턴스를 생성하면서 넣어준 값으로 초기화를 하게 된다.

- #### 지연 저장 프로퍼티(Lazy stored property)

  - 지연 저장된 속성은 처음 프로퍼티가 사용되기 전까지 초기값이 계산되지 않은 특성을 가지고 있는 프로퍼티이다. 따라서, 초기화하는데 오래걸리거나, 복잡한 초기화 과정이 있는 변수의 경우 지연저장을 사용하면 좋다. 
  - 지연 저장 속성은 **lazy**를 키워드 앞에 작성하면 된다.
  - **let**은 지연 저장 프로퍼티로 설정될 수 없다.

### 2. 연산 프로퍼티

- 실제로 값을 저장하지는 않지만 get,  set 키워드를 통해서 값을 간접적으로 설정하거나 받을 수 있다.

- 클래스, 구조체, 열거형에서 사용할 수 있다.

  ```swift
  import Foundation

  struct Point {
      var x = 0.0, y = 0.0
  }
  struct Size {
      var width = 0.0, height = 0.0
  }
  struct Rect {
      var origin = Point()
      var size = Size()
      var center: Point {
          get {
              let centerX = origin.x + (size.width / 2)
              let centerY = origin.y + (size.height / 2)
              return Point(x: centerX, y: centerY)
          }
          set(newCenter) {
              origin.x = newCenter.x - (size.width / 2)
              origin.y = newCenter.y - (size.height / 2)
          }
      }
  }

  var system: Rect = Rect()

  system.origin = Point(x: 5.0, y: 1.0)
  system.size = Size(width: 5.0, height: 10.0)

  print(system.center.x, system.center.y))
  //7.5  6.0
  system.center = Point(x: 10.0, y: 10.0)

  print(system.origin.x)
  //7.5
  ```

   연산 프로퍼티의 get, set에 대해 많이 헤깔리는 부분이 많았다. 어떻게 이해하면 될까 생각을 했는데 연산 프로퍼티는 인스턴스의 프로퍼티로 인해 값이 결정되는 것이다. 따라서, get의 경우는 기존의 인스턴스의 프로퍼티로 인해 연산 프로퍼티의 값이 결정되는 경우이고, set에 경우는 연산 프로퍼티의 값을 설정함으로 인해 다른 프로퍼티의 값이 결정되는 경우로 생각하니깐 이해가 좀 되었따. 

- set에 경우는 값의 이름을 지정하게 되는데 개발자가 값을 지정하지 않을 경우에는 default 값으로 newValue가 설정이 된다.

- 연산 프로퍼티는 get과 set이 둘 다 사용이 되거나 get만 사용을 할 수 있다. set만 사용하는 경우는 없는 것이다.

### 3. 프로퍼티 옵져버

- 프로퍼티 값의 변화를 감시하고 그에 따라 대응한다.

- 초기값이 설정된 저장 프로퍼티에서 사용가능 하다.

- 프로퍼티의 값이 설정될 때마다 호출된다.

- didSet, willSet 키워드를 통해 값 변화의 직전 직후를 감지할 수 있다.

- 값 이름을 지정하지 않으면 didSet은 oldValue, willSet은 newValue가 기분 값으로 설정된다.

  ```swift
  var changeValue:Int = 0{
  	didSet(oldV){
  		print("oldValue \(oldV)")
  	}
  	willSet(willV)
  	{
  		print("newValue \(willV)")
  	}
  }
  changeValue = 4
  ```

  위에 변수 changeValue는 값이 설정될 때마다 아래의 코드가 실행이 될 것이다. 

  아래에 changeValue에 값에 4를 대입한다고 적으면 먼저 willSet이 실행되어 "newValue 4"라는 문자열이 출력되고, changeValue의 값이 4가 되는 순간 didSet이 실행되어 "oldValue 0"이라는 문자열이 출력된다.

### 4. 타입 프로퍼티

- 인스턴스의 속성이 아닌, 타입에 따른 속성을 정의할 때 사용된다.

- static 키워드를 사용해서 값타입에서 타입 프로퍼티를 설정할 수 있으며 class 키워드를 사용해서 클래스 타입에서 타입프로퍼티를 설정할 수 있다.

- 값을 가져올 때는 클래스의 이름을 통해서 가져올 수 있다.

  ```swift
  struct AudioChannel {
  	static let level = 10
  	static var maxLevel = 0
  	var currentLevel: Int = 0 {
  		didSet {
  			if currentLevel > AudioChannel.level
  			{
  			currentLevel = AudioChannel.level
  			}
  			if currentLevel > AudioChannel.maxLevel
  			{
  			AudioChannel.maxLevel = currentLevel
  			}
   	 	}
  	}
  }
  ```

** **



