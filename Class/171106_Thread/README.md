# Thread

### 1. Thread란

- Thread는 어떠한 프로그램 내에서, 특히 **프로세스 내에서 실행되는 흐름의 단위**를 말한다. 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 멀티스레드라고 한다.

- iOS에서 모든 앱은 기본적으로 **main thread**를 가지고 있다. (UIKit)

- 기본적인 UI 및 모든 행동은 main thread에서 실행된다.

  

### 2. Single Thread vs Multi Thread

- **Single Thread**

<img src="https://simajune.github.io/img/posting/Thread1.png" width="400px" height="200px"/>

- **Multi Thread**

<img src="https://simajune.github.io/img/posting/Thread2.png" width="400px" height="250px"/>

- 언제 Multi Thread를 사용할까?
  1. 동시에 작업이 필요한 경우
  2. multi core process를 사용하기 위해
  3. 중요한 작업에 방해를 받지 않기 위해
  4. 상태를 계속 감시해야 할 경우가 필요할 때



- Multi Thread를 사용하는 경우는 다음과 같다.

  1. Network request/response
  2. time control
  3. image download/upload
  4. long time actions

  

### 3. Single Core Process

<img src="https://simajune.github.io/img/posting/Thread3.png" width="300px" height="250px"/>



### 4. 동기/비동기 방식

- 동기(synchronous) : 프로그래밍적으로 어떤 일이 끝난 후 다음 행동을 한다면 동기방식
- 비동기(asynchronous) : 어떤 일이 끝난 것과는 상관앖이 다음 행동을 한다면 비동기 방식
- 디자인 패턴에 의한 비동기 처리는 다음과 같은 것들이 있다.
  - 델리게이트(Delegate), 셀렉터(@selector), 블록(block), 노티피케이션(Notification)



### 5. 교착상태(Deadlock)

- 교착상태란 두개 이상의 작업이 서로 상대방의 작업이 끝나기만을 기다리고 있게 때문에 결과적으로 아무것도 완료되지 못하는 상태를 가리킨다.
- [교착상태에 대해 자세히](http://goo.gl/jTXUXO)



### 6. iOS Multi Thread방법

- Thread : 직접 thread를 만들어서 제어하는 방식
- GCD : Closure 기반의 기법으로 코드 가독성이 좋고 간편하다.
- Operation : GCD기반의 rapper Class. 간단하게 사용가능하고 고수준의 API를 제공한다. 성능이 느린편이다.
- performSelector : Selector를 이용한 방식. ARC이전에 주로 사용한 방식이였으나 GCD 이후엔 많이 사용되진 않는다.
- Timer : 간단한 interval Notification을 제공해주는 Class. 특이하게도 Timer는 mainLoop에서 실행된다.



### 7. GCD(Grand Central Dispatch)

- 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법
- System에서 Thread관리를 알아서 해준다.
- dispatch queue를 이용해 작업들을 컨트롤한다.
- work item : Closure를 활용해서 구현되어 있으며 queue를 생성할 때 꼭 같이 만들어야 한다.



### 8. DispatchQueue

- dispatch queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.

- 모든 dispatch queue는 first-in, first-out(FIFO) 데이터 구조이다.

- Serial Queue와 Concurrent Queue 2종류로 나눌 수 있다.

  - Serial Queue

  <img src="https://simajune.github.io/img/posting/Thread4.png" width="450px" height="250px"/>

  - Concurrent Queue

  <img src="https://simajune.github.io/img/posting/Thread5.png" width="450px" height="250px"/>

- #### **init**

```swift
public convenience init(label: String, qos: DispatchQoS = default, attributes: DispatchQueue.Attributes = default, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default, target: DispatchQueue? = default)

let queue = DispatchQueue(label: “com.sima.queue")
let queueOption = DispatchQueue(label: "com.sima.queue1", qos: .userInitiated)
let queueAttri = DispatchQueue(label: "com.sima.queue2", attributes: [.concurrent, .initiallyInactive])
```



- **Quality Of Service (QoS) and Priorities(우선순위)** 

<img src="https://simajune.github.io/img/posting/Thread6.png" width="500px" height="250px"/>



- Attributes(속성)

```swift
public struct Attributes : OptionSet {
	public static let concurrent: DispatchQueue.Attributes
	public static let initiallyInactive: DispatchQueue.Attributes
}
```

​	Default = 직렬

​	Concurrent = 병렬

​	initiallyInactive = 태스크 수동 실행(**active() 메소드**)



- **async**

```swift
let queue = DispatchQueue(label: "com.sima.async")

queue.async {
}
```



- **Main dispatch Queue**

  - Main Thread를 가리키며 기본 UI를 제어하는 queue이다.

  - Serial 방식으로 들어온 순서대로 진행되며 앞에 작업이 종료될 때까지 뒤의 작업들은 대기한다.

  - 생성

    ```swift
    DispatchQueue.main.async {
        //Do Something
    }
    ```



- **Global dispatch queue**

  - app 전역에 사용되는 queue로서 Concurrent 방식의 queue이다.

  - option으로 qos를 설정할 수 있다.

  - 생성

    ```swift
    let globalQueue = DispatchQueue.global()
    let globalQueue = DispatchQueue.global(qos: .userInitiated)
    ```



- DispatchWorkItem

  - 실행할 수 있는 작업의 캡슐화

  - 이벤트츷 등록, 취소할 수 있다.

  - dispatchQueue에서 실행시킬 수 있다.

    ```swift
    public init(qos: DispatchQoS = default, flags: DispatchWorkItemFlags = default, block: @escaping @convention(block) () -> Swift.Void)
    ```



- Timer

  ```swift
  let delayQueue = DispatchQueue(label: "com.sima.delayqueue", qos: .userInitiated)
  print(Date())
  let additionalTime: DispatchTimeInterval = .seconds(2)
  delayQueue.asyncAfter(deadline: .now() + additionalTime) {
  print(Date())
  }
  delayQueue.asyncAfter(deadline: .now() + 0.75) {
  print(Date())
  }
  ```

  