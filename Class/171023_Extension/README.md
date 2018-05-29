# Extension

### 1. Extensions

- Extensions 는 기존의 클래스, 구조, 열거형 또는 프로토콜 유형에 새로운 기능을 추가하는 기능입니다.

- Extensions로 할 수 있는 것

  1. 연산된 인스턴스 프로퍼티와 연산된 타입 프로퍼티를 추가할 수 있다.
  2. 인스턴스 메소드와 타입 메소드를 정의할 수 있다.
  3. 새로운 초기화를 제공한다.
  4. Sunscript를 정의한다.
  5. 새로 중첩된 타입들을 정의하고 사용할 수 있다.
  6. 프로토콜에 부합하는 존재하고 있는 타입을 만들 수 있다.

  

### 2. 문법

```swift
extension SomeType {
	// new functionality to add to SomeType goes here
}

extension SomeType: SomeProtocol, AnotherProtocol {
	// implementation of protocol requirements goes here
}
```





<img src="https://simajune.github.io/img/posting/Notification1.png" width="375px" height="250px"/>





### 3. 유형 : Compute Properties

```swift
extension Double {
	var km: Double { return self * 1_000.0 }
	var m: Double { return self }
	var cm: Double { return self / 100.0 }
	var mm: Double { return self / 1_000.0 }
	var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
```

- 위에 경우는 Double이란 타입에 새로운 인스턴스를 설정하여 값을 입력할 때 바로 연산이 될 수 있도록 만든 것이다. 



### 4. 유형 :  Init

```swift
extension Rect {
	init(center: Point, size: Size) {
	let originX = center.x - (size.width / 2)
	let originY = center.y - (size.height / 2)
	self.init(origin: Point(x: originX, y: originY), size:size)
	}
}
```

- 위에 경우는 Rect하는 타입을 설정하고 그것이 초기화 될 때에는 originalX와 originalY가 계산이되어 초기화가 이루어진다.



### 5. 유형 : Method

```swift
extension Int {
	func repetitions(task: () -> Void) {
		for _ in 0..<self {
		task()
		}
	}
}

3.repetitions {
	print("Hello!")
}
. // Hello!
. // Hello!
. // Hello!
```

- 위에 경우는 Int라는 타입에 Method를 설정하여 Int라는 타입을 가지는 인스턴스가 Method를 실행할 때의 어떤 일을 하는 설정한다.



### 6. 유형 : Mutating method

```swift
extension Int {
	mutating func square() {
	self = self * self
	}
}

var someInt = 3
someInt.square()
```

- 위에 경우는 metating을 왜 썼냐에 초점을 둔다. 일단 메소드 안에 프로퍼티로 들어온 값을 변경을 할 수 없다. 물론 타입도 변경을 할 수 없다. 따라서 메소드 앞에 mutating이란 키워드를 통해 그 제한(?)을 풀어주는 것이다.



### 7. 유형 : Subscript

```swift
extension Int {
	subscript(digitIndex: Int) -> Int {
		var decimalBase = 1
		for _ in 0..<digitIndex {
			decimalBase *= 10
		}
		return (self / decimalBase) % 10
	}
}
746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7
```

