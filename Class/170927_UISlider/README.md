# UISlider

### 1. UISlider란

- 특정 연속 범위내의 단일 값을 컨트롤하는 클래스



### 2. UISlider 구성

- UISlider는 아래의 그림처럼 Thumb, Track, Maximum Image, Minimum Image로 구성되어 있다. 


  <img src="https://simajune.github.io/img/posting/UISlider1.png" width="400px" height="120px"/>

- UISlider에는 필수적인 단계가 있다.

  - 슬라이더의 범위값을 지정해야 한다.
  - 선택적으로 tint색과 최소, 최대값의 이미지와 같은 슬라이더의 외형적인 부분을 설정한다.
  - 하나 또는 여러개의 메소드를 설정하여 연결시킨다.
  - 슬라이더의 사이즈와 위치를 설정한다.

### 3. UISlider 만들기

- UISlider는 UIControl에 상속되어 있기 때문에 다른 UIControl에 상속되어 있는 UIButton과 큰 차이가 없다.

  ```swift
  let slider = UISlider(frame: CGRect(x: 0, y: 50, width: 300, height: 100))
  slider.backgroundColor = .red
  slider.tintColor = .black
  slider.thumbTintColor = .blue
  slider.addTarget(self, action: #selector(ViewController.action(sender:)), for: .valueChanged)
  self.view.addSubview(slider)
  ```

  위에 코드는 크기가 100x100인 크기의 슬라이더를 만들고 설정으로 배경색이 빨간색, tint 색은 검은색, thumb의 tint 색이 파란색인 슬라이더를 만드는 코드이다.

  <img src="https://simajune.github.io/img/posting/UISlider2.png" width="375px" height="667px"/>


