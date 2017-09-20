# 열거형(Enumeration)

- 그룹에 대해 연관된 값을 정으하고 사용가능한 타입
- 항목 그 자체가 고유의 값이므로 해당 항목에 값을 매칭 시킬 필요가 없다.
- 원시값(rawValue)이라는 형태로 실제 값을 부여할 수 있다.
- 열거형의 초기화를 정의할 수 있고 , 프로토콜을 준수하고, 연산 프로퍼트, 메서드 등을 만들 수 있다.
- 오타나 잘못된 값이 들어오면 컴파일러가 잡아내기 때문에 실수를 줄일 수 있다.

```swift
let months = ["January", "February", "March", "April", "May","June", "July", "August","September", "October","November", "December"]
```

보통 "월"을 쓰려고 하면 위에 코드와 같이 배열을 String으로 타입을 설정하고 나열을 했을 것이다. 하지만 열거형을 쓰게 되면 아래와 같이 쉽게 표현을 할 수 있다.

```swift
enum Month {
	case january
	case february
	case march
	case april
	case may
	case june
	case july
	case august
	case september
	case october
	case november
	case december
}

////////////////////////////////////////
enum Month {
case january, february, march, april, may, june, july, august,
september, october, november, december
}
```

이렇게 지정된 열거 항목은 열거형 값으로 지정이 가능하다. 

```swift
var currentMonth = Month.September
currentMonth = .actober
```

각 case값만 들어갈 수 있으며, 선언 후에는 점(.)을 찍은 뒤 다른 값으로 쉽게 바꿀 수 있다.

```swift
switch currentMonth {
case .january :
    print("january")
case .february :
    print("february")
case .march :
    print("march")
case .april :
    print("april")
case .may :
    print("may")
case .june :
    print("june")
case .july :
    print("july")
case .august :
    print("august")
case .september :
    print("september")
case .october :
    print("october")
case .november :
    print("november")
case .december :
    print("december")
}
```

이렇게 만들어진 열거형은 Switch-case문을 통해 사용이 되며 열거형의 모든 case가 제공될 때에는 default 값을 써줄 필요가 없다.

### RawValue(원시값)

- 열거형의 값은 C와는 다르게 각 항목이 Int값과 연결이 되어 있찌 않다. 즉 위에서 보면 january가 그 값 자체인 것이다. 하지만 rawValue값을 통해 각 각의 열거형 case에 타입의 값을 열거형의 이름으로 선언할 수 있다.

```swift
enum ASCIIControlCharacter: Character {
case tab = "\t"
case lineFeed = "\n"
case carriageReturn = "\r"
}
//////////////////////////////////////////////
enum Month: Int {
case january = 1, february = 2, march = 3, april = 4, may = 5,june = 6, july = 7, august = 8, september = 9,october = 10, november = 11, december = 12
}
/////////////////////////////////////////////
enum CompassPoint: String {
case north = "up", south = "down", east = "right", west = "left"
}
```

위와 같이 열거형의 항목에 Character, Int, String 타입의 값을 지정할 수 있고 만약에 값을 입력하지 않을 경우 Int는 처음 항목부터 원시값이 0으로 입력이 되고 String에 경우는 그 항목 자체가 원시값이 되고 Character에 경우에는 입력을 하지 않으면 오류가 발생한다.

```swift
let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3
let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"
```

위에 코드처럼 .rawValue 프로퍼티를 통해 원시값을 가져올 수 있다.

### Associated values

```swift
enum Barcode {
	case upc(Int, Int, Int, Int)
	case qrCode(String)
}

var productBarcode:Barcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).”)
case .qrCode(let productCode):
print("QR code: \(productCode).")
}
```

