# 클로져(Closure)

- 클로져는 함수와 같이 재사용 가능한 블럭이다. 이것은 콜렉션을 다룰 때 매유 유용하다.

- 클러져는 간단하게 말하면 이름이 없는 함수이다.

- 이름이 없다면 어떻게 사용할 수 있을지 의문이 들 수 있지만 사용하는 방법은 다음과 같다.

  ```swift
  var addNum: (Int, Int) -> Int
  ```

  addNum이라는 변수는 두개의 Int값을 받아서 Int로 리턴을 한다. 이것은 정확하게 변수를 선언하는 함수와 같다. 클로져의 타입은 함수와 같다.

  ```swift
  addNum = {(x: Int, y: Int) -> Int in
  return x + y
  }
  ```

  이것은 함수의 선언과 매우 비슷해보이지만 엄밀히 보면 차이가 있다. 같은 파라미터 리스트가 있고, 반환타입이 있다는 표시(->)가 있고 리턴 타입도 있다. 하지만 클로져의 경우, element가 중괄호 안에 있고 리턴타입 뒤에 in이라는 키워드도 있다. 그리고 이것은 함수처럼 사용될 수 있다.

  ```swift
  let result = addNum(4, 6)
  ```

  여기서 result의 값은 10이 될 것이다.

- 축약 구문

  - 클로져는 축약을 하는 방법이 여러가지가 있다. 첫번째로는 클로져가 하나의 리턴을 가질 경우

    ```swift
    addNum = {(x: Int, y: Int) -> Int in
    	x + y
    }
    ```

    그 다음으로는 스위프트의 타입 추론을 통해서 데이터 타입을 제거할 수 있다. 

    ```swift
    addNum = {(x, y) in 
    	x + y
    }
    ```

    그 다음으로 클로져 addNum은 이미 두개의 Int와 리턴을 Int로 받는 다고 이미 선언을 했다. 그래서 스위프트에게 유추 시킬 수 있다. 그리고 마지막으로 파라미터의 리스트를 생략할 수 있고 스위프트는 파라미터의 첫번째를 0번째 로 시작한다고 예측해서 계산을 하게 된다.

    ```swift
    addNum = {
      $0 + $1
    }
    ```

** **

- 파라미터에 클로져가 들어간 경우

  ```swift
  func operateNumber: (_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
  }
  ```

  위에 함수는 operateNumber라는 이름을 가진, 그리고 파라미터가 두개의 Int와 operation이라는 이름의 파라미터를 가지는 함수를 받고 리턴 타입으로는 Int를 반환하는 함수이다.

  이 함수는 클로져와 함께 사용되었다.

  ```swift
  let addNum: {(a: Int, b: Int) - Int in 
  	return a+ b
  }
  operateNumber(5, 7, operation: addNum)
  ```

  클로져는 위에서 배운대로 축약을 할 수 있다. 위에서 배운대로 축약을 해보고 하나로 합쳐보자.

  ```swift
  operateNumber(4,6, {(a: Int, b: Int) -> Int in 
  		return a + b
  })
  ```

** **

- 클로져의 캡쳐

  - 클로져의 캡쳐는 감싸여진 영역 안에서 사용될 수 있다. 이것은 매우 유용하다.

    ```swift
    func countingClosure() -> (() -> Int) {
      var counter = 0
      let incrementCounter: () -> Int = {
        counter += 1
        return counter
      }
      return incrementCounter
    }
    ```

    이 함수는 파라미터가 없고 리턴이 클로져인 함수이다. 이 클로져는 파라미터가 없고 리턴은 Int를 리턴한다.

    함수로부터 반환된 클로져는 내부 변수인 counter라는 것을 매번 선언을 한다. 매번 이 함수는 다른 counter라는 변수를 불러올 것이다.

    ```swift
    let counter1 = countingClosure()
    let counter2 = countingClosure()

    counter1() // 1
    counter2() // 1
    counter1() // 2
    counter1() // 3
    counter2() // 2
    ```

    여기에서 counter1과 counter2는 같은 함수를 상수로 선언되었다. 하지만 두개의 상수의 선언된 함수는 서로 다른 것이고 이것이 실행 될 때 각각 다르게 실행이 될 것이다.

- Custom sorting with closure

  - 클로져는 콜렉션 타입에서 유용하게 사용을 할 수 있다. 배열에 보면 sorted라는 함수가 있다. 이 함수에 대해 알아보자. 

    ```swift
    let names = ["taejune","jun","bruce","sally"]
    names.sorted()
    //["bruce","jun","sally","taejune"]
    ```

    보통의 sorted 함수는 알파벳순으로 정렬을 시키는 함수이다.

    하지만 클로져를 이용하면 커스텀하게 만들 수 있다.

    ```swift
    names.sorted{ $0.character.count > $1.character.count 
    }
    //["taejune","sally","jun","bruce"]
    ```

    ​

- ㅊ







