# Error

### 1. 예외처리

- 프로그램의 오류 조건에 응답하고 오류 조건에서 복구하는 프로세스
- Swift는 런타임시 복구 가능한 오류를 던지고, 포착하고, 전파하고, 조작하는 기능을 제공합니다.
- 에러는 Error 프로토콜을 준수하는 유형의 값으로 나타냅니다. 실제로 Error 프로토콜은 비어 있으나 오류를 처리할 수 있는 타입임을 나타냅니다.



### 2. Error 발생 메소드를 만드는 순서

1. Error Type 만들기

   - Error 프로토콜을 채택한 Enum 만들기

   ```swift
   enum ErrorEnum:Error
   {
   	case noDataError
   	case networkError
   	case unknowError
   }
   ```

   

2. Error 전달 가능 메소드 만들기

   - Return type 앞에 throws 키워드 작성

     - 함수의 작성 중 에러가 발생할 수 있는 함수에는 매개변수 뒤에 throws 키워드를 작성하여 에러가 전달될 수 있는 함수를 선언합니다.

     ```swift
     //에러전달 가능성 함수
     func canThrowErrors() throws -> String
     //에러전달 가능성이 없는 함수
     func cannotThrowErrors() -> String
     ```

     

3. Error 상황일 때 에러 발생

   - throw 키워드를 사용 에러 변환

     - throw 키워드를 통해 에러를 발생시킬 수 있다

     ```swift
     func canThrowErrors(inputNum:String?) throws -> Int
     {
     	guard let numStr = inputNum else {
     	throw ErrorEnum.noDataError
     	}
         
     	guard let num = Int(numStr) else {
     	throw ErrorEnum.unknowError
     	}
         
     	if num < 0
     	{
     		throw ErrorEnum.minusError
     	}
     	return num
     }
     ```

4. 에러처리

   - 함수가 에러를 throw하면 프로그램의 흐름이 변경되므로 에러가 발생할 수 있는 코드의 위치를 신속하게 식별할 수 있어야 합니다.

   - do-catch를 통한 에러처리

     ```swift
     do {			//pattern에서 모든 에러처리를 위한 패턴처리가 필요하다
     	try expression
     	statements
     } catch pattern 1 {
     	statements
     } catch pattern 2 {
     	statements
     }
     ```

   - Converting to Optional value

     - 에러를 Optional value로 여겨서 처리할 수 있다.

     ```swift
     if let num = try? canThrowErrors(inputNum: “-3")
     {
     	//에러가 발생되지 않을때 실행
     }
     ```

5. 후처리 (Specifying Cleanup Actions)

   - 에러에 의해 함수의 문자게 생기더라도 꼭 해야할 행동이 있다면 후처리를 사용
   - **defer** 구문은 블럭이 어떻게 종료되던 꼭 실행된다는 것을 보장

   ```swift
   func processFile(filename: String) throws {
   	if exists(filename) {
   		let file = open(filename)
   		defer {
   			close(file)
   		}
   		while let line = try file.readline() {
   			// Work with the file.
   		}
   			// close(file) is called here, at the end of the scope.
   	}
   }
   ```