# Harshard 수

양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.

예를 들어 18의 자릿수의 합은 1+8 = 9이고 18은 9로 나누어 떨어지므로 18은 하샤드 수이다. 함수를 만들어 입력 값이 하샤드 수인지 아닌지 판별해라

```swift
///////Collatz함수//////////////
func collatz (number: Int) -> Int {
    var tmpNum: Int = number
    var count: Int = 0
    
    while number > 1 {
        if tmpNum % 2 == 0 {
            tmpNum /= 2
            count += 1
        }else {
            tmpNum = 3 * tmpNum + 1
            count += 1
        }
        
        if tmpNum == 1 {
            return count
        }
        
        if count > 500 {
            return -1
        }
    }
    return count
}

print(collatz(number: 123286325789578297))	
```

