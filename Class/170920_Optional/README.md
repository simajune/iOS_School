# 옵셔널

- 지금까지 모든 변수와 상수는 우리가 구체적인 값을 넣어주어 처리를 했다. var name과 같이 String 변수를 가지고 있다고 할 때 보통은 "정태준"과 같이 값을 줄 수도 있지만 ""과 같이 빈 String을 줄 수 있다. 하지만 이것은 값이 없는 것이 아니라 비어있는 String을 준 것이다.

###1. nil

- nil은 스위프트의 특성 중 하나인 안전성을 비롯해서 나온 것이다. 이것은 값이 아니랑 값의 부재라고 생각하면 된다. 


- 만약 사람에 관한 변수를 만든다고 생각해보자. 변수에는 이름도 있을 것이고 나이도 있을 것이고 직업 등이 있을 것이다. 보통의 경우는 사람의 이름과 나이는 필수로 입력하지만 직업같은 경우는 없는 경우도 있기 때문에 적지 않아야 할 때가 있다 

  ```swift
  var name: String = "Jung"
  var age: Int = 31
  var occupation: String
  ```

- 위에 코드와 같이 직업은 없기 때문에 적지 않았다 하지만 이렇게 적지 않게 되면 컴파일하는 도중에 오류가 발생할 것이다. 왜냐하면 값이 없기 때문이다. 이것을 해결하기 위해서는 옵셔널을 사용해야 한다. 

- 옵셔널은 두가지의 가능성을 가질 수 있는데 한개의 값이 nil이 아님을 나타내고(변수 뒤에 !) 다른 하나는 nil일 가능성(변수 뒤에 ?)을 내포하는 것이다

### 2. 옵셔널이란



![17092001](https://github.com/simajune/iOS_School/blob/master/Img/17092001.png)

옵셔널을 설명하기 위해서는 위에 그림으로 설명할 수 있을 것이다. 하나의 상자에는 숫자가 박스안에 들어가 있고 하나는 박스안에 아무것도 없는 상태이다. 이 두가지 경우의 가능성을 두고 있는 것이 옵셔널이다. 

- 표현방식

  ```swift
  var errorCode: Int?
  ```

  기본적인 변수, 상수의 선언과는 큰 차이가 없으면 차이점이라고 하면 데이터 타입 뒤에 물음표(?)를 뒤에 붙이는지에 차이가 있다.

  > 우리는 옵셔널 타입은 데이터 타입 뒤에 물음표를 붙임으로 만들 수 있다. 흔히 옵셔널 타입은 일반 데이터 타입을 둘르고 있다고 표현한다. 예를 들어 옵셔널 String 타입은 일반 String 타입을 두르는 것이다. 다른 말로는 옵셔널 String 타입이란 박스 안에 String 타입이 들어갈 수도 있고 아예 없을 수도 있다는 뜻이다. 

- 옵셔널 String 타입은 String 타입과 연산이 불가능 하다. 엄밀히 옵셔널 String과 일반 String은 다른 타입인 것이다.

### 3. Unwrapping Optional

- 앞에서 얘기 했듯이 옵셔널 변수는 옵셔널이란 박스 안에 변수가 있거나 없거나이다. 밖에서는 그 안에 값이 들어있는지 없는지 알 수 없다. (개발자들은 제외!!) 따라서 이 안에 있는 값을 보기 위해서는 wrapping되어있는 것을 unwrapping해야하고 이 unwrapping하는 방법에는 총 3가지 방법이 있다. 

- 1. Force unwrapping

  - 말 그대로 강제로 옵셔널이란 박스 안에 있는 값을 꺼내는 것이다. 쉽게 설명하면 망치로 박스를 강제로 부순 후 값을 가져오는 것이다. 하지만 이럴 경우 만약 그 안에 값이 있으면 상관이 없지만 값이 없다면 프로그램은 작종하지 않을 것이다.

  - 표현 방식은 변수 뒤에 느낌표(!)를 붙이는 것이다.

    ```swift
    var name: String? = "Taejune"
    print("my name is \(name!)")
    //my name is taejune
    var age: Int? = 31
    var currentage = age!
    print(currentage)
    //31
    var name: String?
    print("my name is \(name!)")
    //오류 발생
    ```

    위에 코드를 보면 force unwrapping의 예를 들은 것이다. name이란 옵셔널 String에 "Taejune"이란 문자열을 넣었고 이것의 값을 보기 위해서 변수 뒤에 느낌표(!)를 붙여 볼 수 있다. 위에 2가지 경우인 name이나 age는 값이 있기 때문에(nil이 아니기 때문에) 값을 제대로 가져올 수 있었지만 마지막 경우는 name의 값에 nil이 들어가 있는 상태에서 강제로 값을 꺼내오려고 하기 때문에 오류가 발생한다.

- 2. Optional Binding

  - Optional binding은 옵셔널이란 박스 안의 값에 안전하게 접근하기 위한 것이다. 쉽게 설명하면 박스에 노크를 해서 값이 있는지 없는지 확인을 하고 값이 있으면 가져오고 없으면 가져오지 않는 방법이다. 

  - 표현방식은 if let을 붙이는 것이다.

    ```swift
    var name: String? = "Taejune"

    if let unwrappedName = name {
        print("my name is \(unwrappedName)")
    }else {
        print("my name is nil")
    }
    ```

    위에 코드를 보면 if let을 통해 상수 unwrappedName에 옵셔널타입을 넣었을 때 nil이 아니라면 if문 안에 코드를 실행하고 만약에 nil이라면 else문 안의 코드가 실행이 된다.

  - 만약 optional binding해야할 변수가 여러개라면 어떻게 할까?

    ```swift
    var name: String? = "Taejune"
    var age: Int? = 31

    if let unwrappedName = name, unwrappedAge = age {
        print("my name is \(unwrappedName)")
    }else {
        print("my name is nil")
    }
    ```

    binding 해야할 것이 여러개라면 콤마(,)를 붙여 그 뒤에 쓰면 binding할 모든 변수가 다 nil이 아닐 경우에만 if문 안의 구문이 실행이 된다.

- 3. Guard 문 (Early Exit)

  - 만약에 nil의 여부를 체크를 하고 nil일 경우에 다른 실행 없이 바로 나가는 경우에 guard문을 쓸 수 있다. 

  - 이것은 스위프트 내에서 유용한 특징이다.

    ```swift
    var name: String? = "Taejune"

    guard let unwrappedName = name else {
      print("my name is nil")
      return  
    }else {
      print("my name is \(unwrappedName)")
    }
    ```

### 4. Nil coalescing

- Nil coalescing은 nil의 조건을 통해 그리고 그것에 대한 default 값을 할당해서 어떠한 경우에도 값을 얻기 위한 방법이다.

- 표현 방법은 옵셔널 변수 뒤에 물음표 두개(??)를 붙이면 된다. 

  ```swift
  var age: Int? = 31
  var currentAge = age ?? 32
  //31
  var age: Int?
  var currentAge = age ?? 32
  //32
  ```

  위에 코드를 보면 age에 값을 31을 넣고 currentAge에 값을 age ?? 32라고 선언 했다. 이 경우 age의 값이 nil이 아니면 그대로 age의 값이 currentAge에 값으로 대입이 되서 currentAge의 값은 31이 된다.

  그리고 두번째의 경우는 age의 값이 nil이므로 currentAge의 값은 ?? 뒤에 있는 값인 32가 대입되게 된다.

### 5. Optional Chaining

- 인스턴스의 프로퍼티나 메서드에 접근하기 위해 쓰인다.

  ```swift
  var displayLabel: UILabel?
  displayLabel?.text = "displayLabel에 옵셔널 테이닝 사용"
  ```

  ​