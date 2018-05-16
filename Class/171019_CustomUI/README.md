# CustomUI

### 1. CustomView 만들기

- CustomView Class file 만들기

<img src="https://simajune.github.io/img/posting/CustomUI1.png" width="375px" height="667px"/>

### 2. Setting CustomView Class

- UI Component에 Custom Class 설정

  <img src="https://simajune.github.io/img/posting/CustomUI2.png" width="375px" height="667px"/>

  

### 3. Awake from Nib

```swift
class CustomView: UIView {
	override func awakeFromNib() {
		//UI가 만들어 지고 난 후 불리는 함수
		//nib로 UI를 만든 경우 init()함수는 실행되지 않는다.
	}
}
```