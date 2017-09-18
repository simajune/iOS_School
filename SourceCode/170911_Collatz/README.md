# Collatz 함수

1937년 Collatz란 사람에 의해 제기된 이 추측은 입력된 수가 짝수라면 2로 나누고 홀수라면 3을 곱하고 1을 더한다. 결과로 나온 수에 값을 작업을 1이 될 때까지 반복할 경우 모든 수가 1이 된다는 추측이다.

예를 들어, 입력된 수가 6이라면 6 > 3 > 10 > 5 > 16 > 8 > 4 > 2 > 1이 되어 총 8번 만에 1이 된다.

함수를 만들어 입력된 수가 몇번 만에 1이 되는지 반환해라. 만약 500번을 반복해도 1이 되지 않을 경우에는 -1을 반환해라.

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

