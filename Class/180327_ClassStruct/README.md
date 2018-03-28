# Class VS Struct

### 1. Class(클래스)와 Struct(구조체)란

- 클래스와 구조체는 일반적으로 프로그램 코드의 블럭 구조이다.

- 프로퍼티(상수, 변수), 메소드(함수)를 추가할 수 있다.

- 다일 파일에 적용되며 다른 코드에서 사용할 수 있다. (단, 접근 제한자로 인해 사용을 하지 못할 수도 있다.)

- 초기 상태를 설정하기 위해 Initializer가 만들어 지고 사용자가 따로 설정할 수 도 있다.

- 사용시에는 인스턴스로서 사용됨

- 기본 구현된 내용에 Extension을 사용하여 확장시킬 수 있다.

- 프로토콜을 상속받아 사용할 수 있다.


  ​

### 2. 기본 구조	

```swift
class SpecificClass {
    var name: String = ""
    var phone: String = ""
    
    func addName() {
        //content
    }
}

struct SpecificStruct {
    var address: String = ""
    var counter: Int = 0
    
    func addCounter() {
        //content
    }
}
```

- 기본 구조는 클래스와 구조체 둘다 같다.

- 클래스와 구조체 둘다 프로퍼티와 메소드로 구성되어 있다.

  ​

```swift
let someClass = SpecificClass()
let someStruct = SpecificStruct()

someClass.name = "태준"

someStruct.addCounter()
```

- 클래스와 구조체 둘다 사용시에는 인스턴스로 사용이 된다.
- 클래스와 구조체 내부의 프로퍼티나 메소드에 접근하기 위해선 (.)을 사용하여 접근한다.




### 3. 초기화

- 인스턴스에 설정된 속성의 초기값 설정과 초기화하는데 목적이 있다.

- 클래스 및 구조체는 인스턴스로 만들어 질 때 프로퍼티는 적절한 초기값으로 설정이 되어 있어야 한다.

- 구조체는 자동으로 Memberwise Initializers가 만들어진다.

  - Memberwise Initializers란 

    ```swift
    struct Subject {
        var name: String
    }

    class Student {
        var subject: [Subject] = []
        
        func addSubject(name: String){
            let subject = Subject(name: String)
            subject.append(subject)
        }
    }
    ```

    - 위에 코드를 보면 구조체의 초기화를 쓰진 않았지만 밑에 Subject를 초기화할 때 Subject(name: String)란 함수를 쓸 수 있다. 이것은 구조체의 특징으로 프로퍼티의 초기값을 가지게 하는 초기화 메소드가 자동으로 만들어진다. (클래스는 불가능) 물론 커스텀하게 만들 수도 있다.

  - Custom Initializers란

    ```swift
    struct Subject {
        var name: String?
        var score: Int
        
        init(score: Int) {
            self.score = score
        }
    }

    class Student {
        var subject: [Subject] = []
        var score: Int = 0
        
        func addScore(score: Int){
            let score = Subject(score: Int)
        }
    }
    ```

    - 위에 코드를 보면 구조체에 초기화 함수를 사용자가 직접 지정을 할 수가 있다. 이런 경우 Custom Initializers라고 한다.

- 상속과 Initializers

  - 부모의 클래스로부터 상속받은 모든 저장 프로퍼티는 초기화할 때 초기 값을 할당받아야 한다.

  - 스위프트는 클래스 타입에 모든 저장 프로퍼티에 초기값을 받도록 도와주는 방법이 두가지가 있는데, 하나는 Designated Initializers와 Convenience Initializers이다.

    - Designated Initializers
      - 모든 프로퍼티는 초기화되어야 한다.
      - 상속을 받았다면 부모클래스의 Designated Initializers를 호출해야 한다.
    - Convenience Initializers
      - 다른 Convenience Initializers를 호출할 수 있다.
      - 하지만 궁극적으로는 Designated Initializers를 호출해야만 한다.

    <img src="https://simajune.github.io/img/posting/180327ClassStruct.png" width="300px" height="350px"/>

- Required Initializers

  ```swift
  class SomeClass {
      required init() {
      // initializer implementation goes here
      }
  }
  ```

  - 해당 초기화는 필수적으로 구현해야만 한다.
  - 상속받은 모든 클래스와 구조체는 필수로 구현해야 한다.
  - Required Initializers를 구현할 때에는 override 수식어를 사용할 필요 없다.

- Setting a Default Property Value with a Closure or Function

  ```swift
  class SomeClass {
      let someProperty: SomeType = {
      // 해당 클로져 안에 프로퍼티의 기본값을 지정한다.
      // someValue는 반드시 SomeType과 타입이 같아야 한다.
      return someValue
      }()
  }
  ```

  - 클래스의 init시 해당 프로퍼티의 값이 할당되며, 값 대신 클로저나 전역 함수를 사용할 수 있다.
  - 클로저 사용시 마지막에 ()를 붙여 클로저를 바로 실행시킨다.

### 4. Class vs Structures

- Class는 참조 타입이며 Structure는 값 타입이다.

  - 값타입 vs 참조타입

    - Memory구조

      <img src="https://simajune.github.io/img/posting/180327ClassStruct1.png" width="300px" height="200px"/>

      - 값타입은 복사의 개념으로 복사된 객체가 변경이 되면 복사된 객체에는 영향을 끼치지 않지만 참조타입은  참조의 개념으로 하나가 변경이 되면 그것을 참조하는 모든 객체에 변화가 생기게 된다.

- Class는 상속을 통해 부모 클래스의 특성을 상속받을 수 있다.

- Class 는 Type Casting을 사용할 수 있다. 하지만 Structure는 불가능 하다.

- Structure의 프로퍼티는 instance가 var를 통해서 만들어야 수정 가능하다.

- Class는 Reference Counting을 통해 instance의 해제를 계산한다.

- Class는 Deinitializer를 사용할 수 있다.

### 5. Value Type 프로퍼티 수정

- 기본적으로 구조체와 열거형의 값타입 프로퍼티는 인스터스 메소드 내에서 수정이 불가능하다.

- 그러나 특정 메소드에서 수정을 해야하는 경우에는 mutating 키워드를 사용하여 변경이 가능하다.

  ```swift
  struct Point {
      var x = 0.0, y = 0.0
      mutating func moveBy(x deltaX: Double, y deltaY: Double) {
          x += deltaX
          y += deltaY
      }
  }
  ```



### 6. Deinit

```swift
class Student {
    init() {
        //인스턴스 생성시 필요한 내용 구현
    }
    deinit {
        //종료직전 필요한 내용 구현
    }
}
```

