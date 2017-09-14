# 반복문, 조건문을 이용한 연습문제

![17090604](https://github.com/simajune/iOS_School/blob/master/Img/17090604.png)

### 1번 문제

```swift
func check(leapYear: Int) -> String
{
    var returnValue: String = ""
    if leapYear%4 == 0 {
        if leapYear%100 == 0 {
            if leapYear%400 == 0 {
                returnValue = "윤년입니다."
            }else {
                returnValue = "윤년이 아닙니다."
            }
        }else {
            returnValue = "윤년입니다."
        }
    }else {
        returnValue = "윤년이 아닙니다."
    }
    return returnValue
}

check(leapYear: 1955)
```

** **

### 2번 문제

```swift
func addAllDIgit (num: Int) -> Int
{
    var tmpNum: Int = 0
    var resultValue: Int = 0
    let divider: Int = 10
    tmpNum = num
    while tmpNum != 0{
        resultValue += tmpNum % divider
        tmpNum /= 10
    }
    return resultValue
}

addAllDIgit(num: 359758278276206)

```

** **

### 3번 문제

```swift
func revers(num: Int) -> Int
{
    var tmpNum: Int = num
    var resultValue: Int = 0
    
    while tmpNum != 0{
        if tmpNum > 0 {
            resultValue *= 10
            resultValue += tmpNum % 10
            tmpNum /= 10
        }
    }
    return resultValue
}

revers(num: 15141516)
```

** **

### 4번 문제

```swift
func drawStar (line: Int)
{
    var tmpLine: Int = 1
    var index: Int = 0
    var number: Int = 0
    
    while line - tmpLine >= 0 {
        var resultLine: String = ""
        while index < (line - tmpLine) {
            resultLine += " "
            index += 1
        }
        while number < (2 * tmpLine - 1) {
            resultLine += "*"
            number += 1
        }
        tmpLine += 1
        index = 0
        number = 0
        print(resultLine)
    }
}
drawStar(line: 8)
```

#### - while문만 사용

```swift
func drawStar (line: Int)
{
    var tmpLine: Int = 1
    var index: Int = 0
    
    while line - tmpLine >= 0 {
        var resultLine: String = ""
        while index < (line - tmpLine) {
            resultLine += " "
            index += 1
        }
        index = 0
        while index < (2 * tmpLine - 1) {
            resultLine += "*"
            index += 1
        }
        tmpLine += 1
        index = 0
        print(resultLine)
    }
}
drawStar(line: 20)
```

#### - for-in문만 사용

```swift
func drawStar (line: Int)
{
    var emptyNumber: Int
    var starNumber: Int
    
    for index in 1 ... line {
        var resultLine: String = ""
        emptyNumber = line - index
        for _ in 0 ..< emptyNumber {
            resultLine += " "
        }
        starNumber = 2 * index - 1
        for _ in 1 ... starNumber {
            resultLine += "*"
        }
        print(resultLine)
    }
}
drawStar(line: 10)
```

#### - return type을 String으로 구현해서

```swift
func drawStar (line: Int) -> String{
    var emptyNumber: Int
    var starNumber: Int
    var resultString: String = ""
    
    for index in 1 ... line {
        var resultLine: String = ""
        emptyNumber = line - index
        for _ in 0 ..< emptyNumber {
            resultLine += " "
        }
        starNumber = 2 * index - 1
        for _ in 1 ... starNumber {
            resultLine += "*"
        }
        resultString += resultLine + "\n"
    }
    return resultString
}
print(drawStar(line: 10))
```

#### - 반대로 출력

```swift
func drawStar (line: Int)
{
    var emptyNumber: Int
    var starNumber: Int
    
    for index in 1 ... line {
        var resultLine: String = ""
        emptyNumber = line - index
        for _ in 0 ..< emptyNumber {
            resultLine += "*"
        }
        starNumber = 2 * index - 1
        for _ in 1 ... starNumber {
            resultLine += " "
        }
        for _ in 0 ..< emptyNumber {
            resultLine += "*"
        }
        print(resultLine)
    }
}
drawStar(line: 4)
```

