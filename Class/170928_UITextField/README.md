# UITextField

### 1. UITextField란

- 인터페이스 내에 수정가능한 텍스트를 보여주는 객체



### 2. UITextField 구성

- UITextField는 유저가 화면 키보드를 사용하여 텍스트 기반의 입력을 하는데 사용된다. 키보드타입은 일반 텍스트, 이메일, 숫자 등 다양한 타입이 있다. 
- UITextField는 타겟 액션 메커니즘과 수정하는 과정중 발생하는 변화를 델리게이트 를 사용한다.
- 보통의 경우, 가입이나 로그인에 많이 사용하여 어떠한 값을 입력을 받는데 사용된다. 그리고 텍스트를 입력을 하기 위해서는 키보드가 필요하기 때문에 키보드와 연관된 델리게이트를 같이 사용하게 된다.


  <img src="https://simajune.github.io/img/posting/UITextField1.png" width="200px" height="80px"/>

### 3. UITextField 만들기

- UISlider는 UIControl에 상속되어 있기 때문에 다른 UIControl에 상속되어 있는 UIButton과 큰 차이가 없다.

  ```swift
  nameText = UITextField(frame: CGRect(x: 20, y: 50, width: 250, height: 50))
  view.addSubview(nameText)
  nameText.borderStyle = .line
  nameText.textAlignment = .right
  nameText.backgroundColor = .green
  nameText.placeholder = "여기에 입력하세요"
  ```

  위에 코드는 크기가 250x50인 크기의 텍스트필드를 만들고 설정으로 배경색이 녹색, 텍스트 는 오른쪽정렬, placeholder는 ''여기에 입력하세요''를 보여주는 코드이다.

  <img src="https://simajune.github.io/img/posting/UITextField2.png" width="375px" height="667px"/>


