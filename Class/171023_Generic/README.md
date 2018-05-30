# Generic

### 1. Generic이란

- 어떤 타입에도 유연한 코드를 구현하기 위해 사용되는 기능

- 코드의 중복을 줄이고, 깔끔하고 추상적인 표현이 가능하다.

  

### 2. Generic을 사용하는 이유

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temporaryA = a
	a = b
    b = temporaryA
}
```

- 위와 같은 기능은 첫번째 들어온 파라미터와 두번째 들어온 파라미터를 바꾸는 메소드이다. 이 메소드의 파라미터를 보면 무조건 **Int**타입만 파라미터로 받을 수가 있다. 만약 다른 타입도 이러한 기능을 하는 메소드를 만드려고 하면 같은 내용의 코드를 가진 메소드를 타입만 바꿔서 여러개 만들어야 한다. Generic은 이러한 문제를 해결해줄 수 있다. 

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
	let temporaryA = a
	a = b
	b = temporaryA
}
```

- 이렇게 Generic을 이용해 메소드를 만든다면 어떠한 타입이 들어오더라도 두 파라미터를 바꾸는 기능을 한다.



### 3. Type Parameters

- Generic에 사용된 "T"는 타입의 이름이기 보다는 Placeholder의 역할로 사용된 것이다.
- 타입은 <>로 감싸 표시한다.
- 타입의 이름은 보통 사용되는 속성에 맞게 네이밍을 할 수 있으나 아무런 연관이 없는 타입의 경우에는 T,U,V와 같은 알파벳으로 사용된다.