# Closure

### 1. 일급객체

- 컴푸터 프로그래밍 언어 디자인에서 특정 언어의 일급객체라 함은 일반적으로 다른 객체들에 적용 가능한 연산을 모두 지원하는 객체를 가리킨다. 함수에 매개변수로 넘기기, 변수에 대입하기와 같은 연산들이 여기서 말하는 일반적인 연산의 예에 해당한다.

- 다음과 같은 조건을 만족할 때 일급 객체라고 말할 수 있다.

  - 변수나 데이터 구조 안에 담을 수 있다.
  - 파라미터로 전달할 수 있다.
  - 반환값(return value)으로 사용할 수 있다.
  - 할당에 사용된 이름과 관계없이 고유한 구별이 가능하다.
  - 동적으로 프로퍼티 할당이 가능하다.

  

### 2. 중첩함수

- 함수 내부에서 함수를 정의해서 사용되는 함수
- 외부에는 숨겨져 있으며 선언된 함수 내부에서만 호출 가능하다.

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
	func stepForward(input: Int) -> Int { return input + 1 }
	func stepBackward(input: Int) -> Int { return input - 1 }
    
	return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
	print("\(currentValue)... ")
	currentValue = moveNearerToZero(currentValue)
}
```



### 3. 클로저

- 클로저는 코드에서 전달되고 사용할 수 있는 독립적인 기능 블록이다.
- 클로저는 정의된 컨텍스트에서 모든 상수 및 변수에 대한 참조를 캡처하고 저장할 수 있다.
- 글로벌 및 중첩 함수는 함수라고 설명했지만 실제로는 클로저의 특별한 종류이다.
- 클로저의 유형
  - Global function은 이름이 있고 값을 캡처하지 않는 클로저이다.
  - nested function은 이름을 가진 클로저로 내부 함수에서 값을 캡처할 수 있다.
  - Closure expressions는 주변 컨텍스트에서 값을 캡처할 수 있는 간단한 구문으로 작성된 이름없는 클러저입니다.

- 클로저 표현

  ```swift
  {( parameters ) -> return type in
  	statements
  }
  ```

  

### 4. 클로저의 예

- 클로저는 많이 사용하지만 특히, 우리가 자주 사용하게 되는 클로저는 ViewController를 present할 때(변환할 때), 알럿메세지에 대한 행동을 설정할 때, 애니메이션 효과를 줄때 등 여러가지에서 사용이된다.

  ```swift
  self.present(nextVC, animated:true, completion:( () -> void )? )
  
  let alert = UIAlertAction(title: "알럿", style: .default, handler: ((UIAlertAction) -> Void)? )
  
  UIView.animate(withDuration: 0.3, animations: () -> Void, completion: ((Bool) -> Void)?)
  ```

  

### 5. 클로저 간소화

- 컨텍스트로부터 파라미터를 유추하거나 값의 타입을 반환할 수 있다.

  ```swift
  override func viewDidLoad() {
  	super.viewDidLoad()
  	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
      //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
  	let sorted = names.sorted(by:{ s1, s2 in return s1 > s2 })
  	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
  }
  ```

  - s1과 s2는 배열에서 가져온 인자이기 때문에 타입을 유추할 수 있다. 또 리턴 결과 값으로 인해 리턴의 타입도 유추 가능하다. **즉, 클로저를 함수 또는 메소드에 인라인 클로저 표현식으로 전달할 때 항상 매개변수 유형 및 리턴 유형을 유추할 수 있다.**

- 단일 표현된 클로저에서 반환값을 암시한다. 따라서 return키워드를 사용하지 않아도 된다.

  ```swift
  override func viewDidLoad() {
  	super.viewDidLoad()
  	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
  	//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
  	let sorted = names.sorted(by:{ s1, s2 in s1 > s2 })
  	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
  }
  ```

  - 클로저 내부 구현부에 리턴 내용이 한줄로 단순하게 표시되어 있다면 return 키워드를 생략 가능하다.

- argument 이름을 속기(예: $0)로 표현할 수 있다.

  ```swift
  override func viewDidLoad() {
  	super.viewDidLoad()
  	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
  	//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
  	let sorted = names.sorted(by:{ $0 > $1 })
  	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
  }
  ```

  - 스위프트는 인라인 클로저에 자동으로 Shorthand Argument Names를 제공하며, 클로저 인수의 값 이름을 속기로 쓸수 있다. 

  

### 6. Trailing Closures

- 함수에 클로저 표현식을 함수의 최종 인수로 전달해야하고 클로저 표현식이 길면 후행 클로저로 작성하는 것이 유용할 수 있다. Trailing Closures를 사용하면 함수 호출의 일부로 클로저의 인수 레이블을 쓰지 않는다.

  ```swift
  func someFunctionThatTakesAClosure(closure: () -> Void) {
  	// function body goes here
  }
  
  // Here's how you call this function without using a trailing closure:
  func someFunctionThatTakesAClosure(closure: {
  	// closure's body goes here
  })
  
  // Here's how you call this function with a trailing closure instead:
  func someFunctionThatTakesAClosure() {
  	// trailing closure's body goes here
  }
  ```

- 클로저 표현식이 함수 또는 메소드의 유일한 인수로 제공되고 그 표현식을 후행 클로저로 제공하면 함수를 호출할 때 함수 또는 메소드의 이름 뒤에 한 쌍의 괄호를 쓸 필요가 없다.

  ```swift
  override func viewDidLoad() {
  	super.viewDidLoad()
  	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
  	//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
  	//let sorted = names.sorted { $0 > $1 }
  	let sorted = names.sorted() { $0 > $1 }
  	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
  }
  ```



### 7. Operator Methods

- 스위프트의 greater-than 메소드는 (>)의 정의를 보면 String type의 두 매개변수가 있고, Bool type값을 반환합니다. 이것은 sorted(by:)메소드에 필요한 메소드 유형과 정확히 일치합니다. 따라서 greater-than 연산자를 전달하기만 하면 스위프트는 문자열 관련 구현을 사용하려고 한다고 추론한다.

  ```swift
  override func viewDidLoad() {
  	super.viewDidLoad()
  	let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
  	//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
  	let sorted = names.sorted(by:{ > })
  	print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
  }
  ```

  

### 8. 변수 할당

```swift
let closureValue = {(name:String) in print(name) }
closureValue("june")
```



### 9. 캡쳐

- 클로저 안의 모든 상수와 변수에 대한 참조를 캡쳐해서 관리한다.

- 스위프트는 캡쳐를 위한 모든 메모리를 관리한다.

  ```swift
  func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  	var runningTotal = 0
  	func incrementer() -> Int {
  		runningTotal += amount
  		return runningTotal
  	}
  	return incrementer
  }
  
  let incrementByTen = makeIncrementer(forIncrement: 10)
  incrementByTen()
  // returns a value of 10
  incrementByTen()
  // returns a value of 20
  incrementByTen()
  // returns a value of 30
  ```

  - 클로저의 중요한 기능 중 하나가 바로 캡쳐이다. 보통의 메소드나 함수를 위와 같이 10을 더하는 기능을 한다면 아래의 값들은 다 10이 출력이 됐을 것이다. 하지만 클로저의 캡쳐기능 때문에 아래의 값들이 계속 10씩 더해져 출력이 되게 된다.



### 10. map

- map은 지도가 아닌 mapping이란 단어로 이해
- 컬렉션의 각 항목의 데이터를 다른 데이터로 변경해주는 역할
- 클로저를 이용, 각 항목에 대해 한번 호출되며 해당 항목에 대해 mapping된 값을 반환한다. (다른 타입도 가능)

```swift
public func map<T>(_ transform: (Element) -> T) -> [T]

let digitNames = [1,2,3,4,5]
let starList = digitNames.map { (number) -> String in
	var star = ""
	for _ in 0..<number
	{
		star += "*"
	}
	return star
}

print(startList)
```



### 11. Filter

- 컬렉션의 특정 아이템을 걸러내는 함수
- 클로저를 통해 걸러내어야 하는 데이터의 조건을 전달해준다.

```swift
filter(_ isIncluded: (Element) -> Bool) -> [Element]

let digitNames = [1,2,3,4,5]
let evenNumbers = digitNames.filter { (number) -> Bool in
	return number % 2 == 0
}
print(evenNumbers)
```



### 12. Reduce

- 컬렉션 내부의 모든 컨텐츠의 값을 하나의 값으로 합쳐주는 함수
- 인자를 2개 받으면 첫번때 인자는 초기값, 두번째 이자는 클로저로서 결과값과 인자를 합치는 역할을 합니다.

```swift
reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Bound) -> Result) -> Result

let digitNames = 1...10
let allSum = digitNames.reduce(0) { (num1, num2) -> Int in
	num1 + num2
}
print(allSum)
```