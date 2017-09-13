# 콜렉션 타입 (Collection Type)

- 스위프트는 값(데이터)의 모음을 저장하고 관리하기 위한 **배열**, **세트**, 및 **딕셔너리**라는 세가지 기본 형식을 제공하고 이를 콜렉션 타입이라고 한다. 
- **배열(Array)**은 <u>**정렬된 값의 모음으로 값마다 고유한 번호**</u>를 가지고 있다.
- **세트(Set)**은 고유한 **<u>값이 정렬되지 않은 채로 모여있는 형태</u>**이다. 따라서 집합 안에서는 같은 값이 존재 하지 않는다.
- **딕셔너리(Dictionary)**는 **<u>키(Key)</u>**와 **<u>값(Value)</u>**를 가지고 있고 그것이 **<u>정렬이 되지 않은 있는 형태</u>**이다. Dictionary안에서는 같은 값들은 존재할 수 있지만 같은 키는 존재할 수 없다.

![![17091001](https://github.com/simajune/iOS_School/blob/master/Img/17091001.png)]

- 콜렉션 타입도 변수(var)나 상수(let)로 할당이 가능하며 **변수(var)**로 할당할 경우 안에 있는 데이터를 변경 가능하다. 즉, 추가, 제거, 수정이 가능하다. 하지만 **상수(let)**으로 할당을 하게 되면 이 이후로는 변경을 할 수 없다.

** **



### 1. 배열(Array)

- 배열(Array)은 번호(index)와 이 번호에 대응하는 데이터들로 이루어진 자료 구조이다. 일반적으로 **배열에는 같은 종류의 데이터들이 순차적으로 저장**되어, 값의 번호가 곧 배열의 시작점으로부터 값이 저장되어 상대적인 위치가 된다. 

- 배열(Array) 문법

  ```swift
  var 배열이름: [데이터타입] = [데이터타입]()
  var 배열이름: Array<데이터타입> = Array<데이터타입>()
  //리터럴
  var 배열이름: [데이터타입] = []
  /////////////////////////////////////////////////
  var someInts: [Int] = [Int]()
  var someInts: Array<Int> = Array<Int>()
  //리터럴
  var someInts: [Int] = []
  ```

- 배열(Array)의 값 가져오기

  - index를 통해 배열의 값을 가져올 수 있다

  - 배열의 첫번째 값은 index가 0이다

    ```swift
    var simeInts: [Int] = [1, 2, 3, 4]
    print("\(someInts[0])")	// -> 1
    print("\(someInts[3])")	// -> 4
    ```

** **



### 2. Set

- Set은 같은 타입의 데이터가 순서없이 모여있는 자료구조로 각 항목의 순서가 중요하지 않거나 한번만 표시해야하는 경우 배열 대신 사용

- Set의 문법

  ```swift
  var Set이름: Set<데이터타입> = Set<데이터타입>()
  //리터럴
  var Set이름: Set<데이터타입> = [1, 2, 3, 4]
  var Set이름: Set = ["Sima", "june"]
  /////////////////////////////////////////////////
  var dataValue: Set<Int> = Set<Int>()
  //리터럴
  var dataValue: Set<Int> = [1, 2, 3, 4]
  var dataString: Set = ["Sima", "june"]
  ```

- Set의 값 가져오기

  - Set는 순서가 정해져 있지 않기 때문에 For-in문을 통해서 데이터를 가져와야 한다.
  - 순서는 정해져 있지 않지만 정렬을 통해 데이터를 원하는 순서대로 가져올 수 있다.

** **



### 3. Dictionary

- 요소들이 순서 없이 키와 값의 쌍으로 구성되는 자료 구조로 저장되는 값은 항상 키와 쌍을 이루어야 한다. 키는 하나이거나 여러개일수 있지만 하나의 Dictionary 안에는 같은 키가 존재해서는 안된다.

- 항목의 순서가 중요치 않고 키(Key)를 통해서 데이터를 접근할 때 사용한다.

- Dictionary의 문법

  ```swift
  var Dictionary이름: [데이터타입: 데이터타입] = [데이터타입: 데이터타입]()
  var Dictionary이름: Dictionary<데이터타입, 데이터타입> = [:]
  //리터럴
  var airports: [String:String] = ["ICH":"인천공항", "CJU":"제주공항"]
  ```

- Dictionary의 값 가져오기

  - 키(Key)을 통해서 값(Value)을 가져올 수 있다.

    ```swift
    var airports: [String:String] = ["ICH":"인천공항", "CJU":"제주공항"]
    print("\(airports["ICH"])")	// -> 인천공항
    print("\(airports["CJU"])")	// -> 제주공항
    ```





