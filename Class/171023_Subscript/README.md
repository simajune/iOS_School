# Subscript

### 1. Subscript

- 클래스, 구조체, 열거형의 Collection, List, Sequence의 멤버에 접근 가능한 단축문법인 Subscript를 정의할 수 있다.

- Subscript는 별도의 setter/getter 없이 index를 통해서 데이터를 설정하거나 값을 가져오는 기능을 한다.

- Array[index] / Dictionary["Key"] 등의 표현이 Subscript이다.

  

### 2. 문법

```swift
subscript(index: Type) -> Type {
	get {
		// return an appropriate subscript value here
	}
	set(newValue) {
		// perform a suitable setting action here
	}
}

subscript(index: Type) -> Type {
	// return an appropriate subscript value here
}
```



### 3. 예제

- Array

  ```swift
  class Friends {
  	private var friendNames:[String] = []
  	subscript(index:Int) -> String
  	{
  		get {
  			return friendNames[index]
  		}
  		set {
  			friendNames[index] = newValue
  		}
  	}
  }
  
  let fList = Friends()
  fList[0] = "joo"
  ```



- struct

  ```swift
  struct TimesTable {
  	let multiplier: Int
  	subscript(index: Int) -> Int {
  		return multiplier * index
  	}
  }
  
  let threeTimesTable = TimesTable(multiplier: 3)
  print("six times three is \(threeTimesTable[6])")
  ```



- 다중 Parameter

  ```swift
  struct Matrix {
  	let rows: Int, columns: Int
  	var grid: [Double]
  	init(rows: Int, columns: Int) {
  		self.rows = rows
  		self.columns = columns
  		grid = Array(repeating: 0.0, count: rows * columns)
  	}
  	subscript(row: Int, column: Int) -> Double {
  		get {
  			return grid[(row * columns) + column]
  		}
  		set {
  			grid[(row * columns) + column] = newValue
  		}
  	}
  }
  
  var metrix = Matrix(rows: 2, columns: 2)
  metrix[0,0] = 1
  metrix[0,1] = 2.5
  ```

  