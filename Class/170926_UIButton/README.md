# UIButton

### 1. UIButton이란

- 사용자의 이벤트를 받아 처리해주는 UI


### 2. UIButton의 구조

- Title

- Image

- backgroundImage

  <img src="https://simajune.github.io/img/posting/UIButton.png" width="600px" height="180px"/>

### 2. UIButton 만들기

```swift
let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
btn.setTitle("버튼", for: .normal)
btn.backgroundColor = .red
btn.setTitleColor(.green, for: .normal)
btn.addTarget(self, action:#selector(ViewController.btnAction(sender:)), for: .touchUpInside)
self.view.addSubview(btn)
```

위에 코드처럼 하게 되면 좌표가 (0, 0)이고 크기가 100x100인 button를 만들고 버튼의 타이틀은 "버튼"이고 배경은 빨간색으로 적용하고 타이틀의 색은 녹색, 그리고 이 버튼을 눌렀을 때 액션을 하게 될 메소드를 설정하고 이 버튼을 뷰에 적용시킨다.

<img src="https://simajune.github.io/img/posting/UIButton1.png" width="375px" height="667px"/>




