# Notification

### 1. Notification Center

- 특정 이벤트가 발생하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스

- 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 관찰자(Observer)로 등록을 해두면 **Notification Center**가 모든 관찰자 객체에게 알림을 준다.

  

### 2. Notification 구조

<img src="https://simajune.github.io/img/posting/Notification1.png" width="375px" height="250px"/>

1. 객체A가 Notification Center에 자신이 Notification을 받을 것이라고 등록 (등록은 .addObserver를 통해 한다)

2. 객체B가 필요한 시점에 Notification 송출 (postNotification)
3. Notification Center에서 적절한 객체와 메소드를 찾아 호출



### 3. Notification 만들기

```swift
//Observer
let notiCenter = NotificationCenter.default
notiCenter.addObserver(forName:Notification.Name(rawValue:"keyName"), object: nil, queue: nil)
{ (noti) in
	//노티가 왔을때 실행될 영역
}

//Poster
func postNoti() {
	NotificationCenter.default.post(name: NSNotification.Name(rawValue: "key"), object: nil)
}
```

