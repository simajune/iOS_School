# ARC

### 1. 메모리 관리 방식

- 명시적 해제 : 모든 것을 개발자가 관리함

- 가비지콜렉터 : 가비지 콜렉터가 수시로 확인해서 안쓰는 객체를 해제시킴(시스템 부하)

- 레퍼런스 카운팅 : 오너쉽 정책에 의해 객체의 해제 정의

  


### 2. Reference counting

```objective-c
NSString *str1 = [[NSString alloc] init];
NSString *str2 = [str1 retain];
NSString *str3 = str2;
[str1 release];
[str2 release];

- (id)init{
	retainCount = 1;
}

- (id)retain{
	retainCount += 1;
	return self;
}

- (void)init{
	retainCount -= 1;
	if(retainCount == 0)
	[self dealloc];
}

```

- init을 하게 되면 retainCount가 1로 설정이 된다. 그리고 retain을 하게 되면 기존의 retainCount를 1 증가시키고 그 값을 반환한다. 



```objective-c
NSString *str1 = [[NSString alloc] init];
NSString *str2 = [[NSString alloc] init];
NSString *str3 = [[NSString alloc] init];
str2 = [[NSString alloc] init];
[str1 release];
[str2 release];
[str3 release];
```

- 위에 코드에 무슨 문제가 있는가? 위에 코드를 보면 str1, str2, str3을 init을 하면서 retainCount가 각각 1씩 된다. 하지만  str2를 다시 init을 했기때문에 release에서 str2는 메모리가 해제가 되지 못하고 좀비 상태가 된다. 이러한 문제때문에 WWDC 2011에서 ARC라는 새로운 시스템이 도입된다.



### 3. ARC 도입 이유

- 앱의 비정상 종료 원인 중 많은 부분이 메모리 문제. 메모리 관리는 애플의 앱 승인 거부(rejection)의 대다수 원인 중 하나
- 많은 개발자들이 수동적인 (retain/release) 메모리 관리로 힘들어 함
- retain/release로 코드 복잡도가 증가



### 4. ARC란

- ARC는 Automatic Reference Counting의 약자로 기존에 수동(MRC)으로 개발자가 직접 retain/release를 통해 reference counting을 관리해야 하는 부분을 자동을 해준다.



### 5. ARC 규칙

- retain, release, retainCount, autorelease, dealloc을 직접 호출 할 수 없다.

- 구조체 내의 객체 포인트를 사용할 수 없다.

- id나 void * type을 직접 형변환 시킬 수 없다.

- NSAutoreleasePool 객체를 사용할 수 없다.

  

### 6. 새로운 지시어 (Strong, Weak)

- strong 객체 선언

```swift
//objective-c
@property(strong) Person *p1;
@property(strong) Person *p2;

//swift
var p1:Person
var p2:Person
```



- #### **Strong 할당**

```swift
p1 = [[Person alloc] init];
p1 = Person()
---------------------------------
p2 = p1
```

| <img src="https://simajune.github.io/img/posting/ARC1.png" width="400px" height="150px"/> |
| ------------------------------------------------------------ |
| <img src="https://simajune.github.io/img/posting/ARC2.png" width="400px" height="150px"/> |

- p1을 초기화 시키면 위의 그림과 같이 ref count가 1로 된다. 그리고 다음 p2가 p1을 참조하게 되고 참조하는 순간 ref count가 1이 증가해서 2가 된다.

- p1은 strong 지시어로 만들었기 때문에 객체에 대한 참조 포인트와 소유권을 가지고 있다. 즉, 할당이 될 때마다 reference count가 증가한다.

  



- #### **Weak 할당** 

```swift
@property(strong) Person *p1;
@property(weak) Person *p2;

var p1:Person
weak var p2:Person
```

| <img src="https://simajune.github.io/img/posting/ARC1.png" width="400px" height="150px"/> |
| ------------------------------------------------------------ |
| <img src="https://simajune.github.io/img/posting/ARC3.png" width="400px" height="150px"/> |

- p1을 초기화 시키면 위의 그림과 같이 ref count가 1로 된다. 그리고 다음 p2가 p1을 참조하게 되고 참조하는 순간 ref count가 1이 증가해서 2가 되야하지만 p2는 weak라는 지시어로 약한 참조를 하게된다. 따라서 ref count는 2가 아닌 1이된다.
- p1은 strong지시어로 만들었기 때문에 객체에 대한 참조 포인트와 소유권을 가지고 있지만 p2는 약한 참조로 소유권은 없이 참조를 할 수 있는 권한만 있다. 즉, p2가 참조해도 reference count는 증가하지 않는다.
- 만약 약한 참조로 만든 p2에 객체를 만들고 할당을 한다면 p2는 소유권이 없어 reference count를 증가 시킬 수 없고 reference count가 0인 객체는 자동으로 해제되기 때문에 p2는 곧바로 nil값을 가지게 된다.
- 그렇다면 왜 weak라는 지시어를 사용하는 것일까? 그것은 다음에 알아보도록 하자



### 7. 순환참조

1. #### strong일 경우

<img src="https://simajune.github.io/img/posting/ARC4.png" width="400px" height="250px"/>

- 위와 같이 여러개의 객체가 있다. 객체2는 객체1과 객체5를 참조하고 있고 객체3은 2를, 객체4은 3을, 객체5는 4를 참조하고 있다. 

<img src="https://simajune.github.io/img/posting/ARC5.png" width="400px" height="250px"/>

- 이 상황에서 객체1이 인스턴스 해제가 되게 되면 어떻게 되는지 살펴보자.

<img src="https://simajune.github.io/img/posting/ARC6.png" width="300px" height="250px"/>

- 객체1이 해제가 되게 되면 원래는 모든 객체가 다 사라져야 하지만 객체2의 reference count가 2이기 때문에 객체1을 제외한 모든 객체가 모두 살게되고 이것을 해제시킬수 없는 일이 발생한다. 이런 현상을 막기위해 weak라는 지시어를 쓰게 된다.



2. #### weak일 경우

<img src="https://simajune.github.io/img/posting/ARC7.png" width="400px" height="250px"/>

<img src="https://simajune.github.io/img/posting/ARC8.png" width="400px" height="250px"/>

- 처음 상황은 위에 strong의 상황과 같다. 하지만 객체 2가 weak라는 지시어를 통해 참조를 하기 때문에 reference count가 증가하지 않아 객체2의 reference count는 1이 되게 된다.

<img src="https://simajune.github.io/img/posting/ARC9.png" width="300px" height="250px"/>

- 따라서, 객체1이 인스턴스 해제가 되면 객체2의 reference count가 1이기 때문에 객체2도 인스턴스 해제가 되게 되고 나머지 객체도 연쇄적으로 해제가 일어나 모든 객체가 사라지게 된다.
- weak point를 사용하는 이유는 순환참조를 막기 위해, autorelease pool을 대신하여 자동해제가 필요한 경우, view의 strong 참조 때문에 사용을 한다.



### 8. unowned vs weak

- Unowned : 소유권이 없는 참조임을 나타내는 지시어
- Optional차이
  1. Unowned : 절대 nil이 아니다.
  2. Weak : nil일 수도 있다.