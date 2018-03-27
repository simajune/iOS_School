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
        
        func addSubject(naeme: String){
            let subject = Subject(name: String)
            subject.append(subject)
        }
    }
    ```

    - 위에 코드를 보면 구조체의 초기화를 쓰진 않았지만 밑에 Subject를 초기화할 때 Subject(name: String)란 함수를 쓸 수 있다. 이것은 구조체의 특징으로 프로퍼티의 초기값을 가지게 하는 초기화 메소드가 자동으로 만들어진다. (클래스는 불가능) 물론 커스텀하게 만들 수도 있다.