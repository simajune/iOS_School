# UserDefault

### 1. UserDefault란

- UserDefault를 설명하려면 이전에 데이터 저장 방법을 설명해야 한다. 
- 데이터의 저장 방법에는 3가지가 있다.
  - 파일 저장(Property List, SQLite, 아카이빙)
  - iOS DataBase이용 - Core Data
  - Network - Server DB 이용
- UserDefault는 이중에서 파일 저장의 Property List를 이용한 데이터 저장 방법이다.
- 사용자의 정보를 저장하는 싱글턴 인스턴스(간단히 말해 하나의 인스턴스를 공유하여 사용)
- 간단한 사용자 정보를 저장/불러오기가 가능
- 내부적으로 Plist파일로 저장되어 보안이 강하진 않음




### 2. UserDefault 주요항목

```swift
open class var standard: UserDefaults { get }
//데이터 불러오기
open func object(forKey defaultName: String) -> Any?
open func string(forKey defaultName: String) -> String?
open func array(forKey defaultName: String) -> [Any]?
//데이터 저장하기
open func set(_ value: Any?, forKey defaultName: String)
//데이터 지우기
open func removeObject(forKey defaultName: String)
```



