# UIAlertController

### 1. UIAlertController란

- 경고 메세지를 유저에게 보여주는 객체




### 2. UIAlertController 개요

- 이 클래스는 alert을 설정하는데 사용한다. Alert에 대한 설정은 그 메세지와 선택을 했을 때 어떠한 동작을 할지에 대한 것이다. 
- UIAlertController은 크게 3가지만 기억을 하면 된다.
  1. UIAlertController
  2. UIAlertAction
  3. Present



#### a. UIAlertController

- UIAlertController에서 Alert에 제목과 메세지 그리고 Alert의 스타일을 설정을 한다.

#### b. UIAlertAction

- UIAlertAction은 Alert에서의 버튼을 설정을 하고 그 버튼을 눌렀을 때 어떠한 동작을 할지 설정을 한다.

#### c. Present

- Present는 이 설정을 보여주는 메소드이다.



### 3. Sample Code

```swift
func btnAction(sender:UIButton) {
	let alertVC = UIAlertController.init(title: "타이틀", message: "알럿 메세지", preferredStyle: .alert)
	let okAction = UIAlertAction.init(title: "확인", style: .default) { (action) in
	//버튼 클릭시 실행 코드
	}
	alertVC.addAction(okAction)
	self.present(alertVC, animated: true) {
	//알럿 띄운 후 실행할 액션
	}
}
```

<img src="https://simajune.github.io/img/posting/UIAlertController1.png" width="414px" height="718px"/>

