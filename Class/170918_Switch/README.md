# 연산자와 Switch문

### 1. 연산자

- 저번에 배운 연산자 외에 추가되는 연산자가 있다. 그것이 바로 Identity연산자와 삼항연산자이다. 

1. Identity연산자

   | Identity연산자 | 예제                  | 설명                              |
   | ----------- | ------------------- | ------------------------------- |
   | ===         | person2 === person1 | person1과 person2는 같은 인스턴스인 경우 참 |
   | !==         | person2 !== person1 | person1과 person2는 다른 인스턴스인 경우 참 |

2. 삼항연산자

   | 삼항연산자                       | 설명                                       |
   | --------------------------- | ---------------------------------------- |
   | question ? answer1: answer2 | question이 참이면 answer1값을 거짓이면 answer2값을 지정한다. |

   ```swift
   let age = 20
   var result:String = age > 19 ? "성년" : "미성년"
   //이 경우 상수 age의 값이 19보다 크므로 result의 값은 "성년"이 대입 된다.
   ```

** **

### 2. Switch문

- 패턴 비교문으로 가장 첫번째 매칭 되는 패턴의 구문이 실행이 된다.

  ```swift
  switch someCharacter {
  case "a":
  	print("The first letter of the alphabet")
  case "z", "y":
  	print("The letter of the alphabet")
  default:
  	print("Some other character")
  }
  ```

  위에 코드를 보면 switch문을 이용해서 someCharacter의 값을 비교하는 부분이다. someCharacter의 값이 "a"이면 "The first letter of the alphabet"란 문자열이 출력될 것이고, 값이 만약 "z"나 "y"일 경우에는 "The letter of the alphabet"란 문자열이 그 외의 문자인 경우에는 "Some other character"라는 문자열이 출력될 것이다.

- 각 상태는 case 키워드를 통해 나타낼 수 있다.

- 각 case 상태의 끝에는 콜론(:)을 작성해서 매칭 패턴을 종료한다.

- 여러개의 case가 필요하면 콤마(,)를 통해 상태를 추가할 수 있다.

- 각 case는 분기로 실행되고 매칭된 해당 case문이 종료되면 switch문을 종료시킨다.

- 각 case의 상태는 switch문의 case에 매칭된 값의 지점을 결정하고 모든 값에 대해 매칭이 되어야 한다. 만약 매칭되는 값이 없다면 default를 사용하여 모든 값이 매칭되도록해야 한다.

- #### Interval matching

  - Switch문의 상태는 단순 값의 매칭을 넘어 다양한 패턴을 통해 매칭을 할 수 있다.

  - Interval matching은 범위연산자를 통해 해당 범위에 해당하는 값을 매칭시킬 수 있다.

    ```swift
    func interSwitch(count:Int)
    {
    	let countedThings = "moons orbiting Saturn"
    	let naturalCount: String
    	switch count {
    	case 0:
    		naturalCount = "no"
    	case 1..<5:
    		naturalCount = "a few"
    	case 5..<12:
    		naturalCount = "several"
    	case 12..<100:
    		naturalCount = "dozens of"
    	case 100..<1000:
    		naturalCount = "hundreds of"
    	default:
    		naturalCount = "many"
    	}
    	print("There are \(naturalCount) \(countedThings).")
    }
    ```

- #### 튜플 매칭

  - 튜플을 사용해서 여러개의 값을 통시에 확인할 수 있다.

  - 사용가능한 모든 값에 대한 매칭은 와일드 카드(_)를 통해서 매칭이 가능하다.

    ```swift
    func getPoint(somePoint:(Int,Int))
    {
    	switch somePoint {
    	case (0, 0):
    		print("\(somePoint) is at the origin")
    	case (_, 0):
    		print("\(somePoint) is on the x-axis")
    	case (0, _):
    		print("\(somePoint) is on the y-axis")
    	case (-2...2, -2...2):
    		print("\(somePoint) is inside the box")
    	default:
    		print("\(somePoint) is outside of the box")
    	}
    }
    ```

- #### 값 바인딩

  - case 내부에서 사용되는 임시 값으로 매칭이 가능하다.

  ```swift
  func getPoint(somePoint:(Int,Int))
  {
  	switch somePoint {
  	case (0, 0):
  		print("\(somePoint) is at the origin")
  	case (let x, 0):
  		print("on the x-axis with an x value of \(x)")
  	case (0, let y):
  		print("on the y-axis with an y value of \(y)")
  	case (-2...2, -2...2):
  		print("\(somePoint) is inside the box")
  	default:
  		print("\(somePoint) is outside of the box")
  	}
  }
  ```

- #### Where문

  - Switch문에 where문을 사용하여 더 추가적인 조건을 넣을 수 있다.

  ```swift
  func wherePoint(point:(int,Int))
  {
  	switch point {
  	case let (x, y) where x == y:
  		print("(\(x), \(y)) is on the line x == y")
  	case let (x, y) where x == -y:
      print("(\(x), \(y)) is on the line x == -y")
      case let (x, y):
  	print("(\(x), \(y)) is just some arbitrary point")
  	}
  }
  ```