# Segue

### 1. Segue란

- Storyboard 파일 내 두개의 ViewController 사이의 화면전환을 정의한 인스턴스
- 앱의 인터페이스 흐름을 확인하는데 도움
- Segue의 시작점은 UIButton, UITableView의 Selected row, UIGesture등으로 시작하며, 끝접은 전환되는 다음 UIViewController를 가르킨다.
- Segue 화면전환이 된 UIViewController는 unwind segue를 통해 되돌릴 수 있다.



### 2. Segue 만들기

<img src="https://simajune.github.io/img/posting/Segue1.png" width="800px" height="540px"/>

- Segue를 만들기 위해 Storyboard를 열고 UIViewController에 UIButton 하나를 만든다.
- 그리고 UIButton을 마우스 오른쪽 버튼을 눌러 이동할 UIVIewController에 드래그한다.

<img src="https://simajune.github.io/img/posting/Segue2.png" width="800px" height="540px"/>

- 드래그를 하면 창이 하나 뜨고 Segue의 스타일을 어떻게 할지 정할 수 있다.

<img src="https://simajune.github.io/img/posting/Segue3.png" width="800px" height="540px"/>

- 하나의 스타일을 누르게 되면 위의 그림처럼 UIViewController 사이에 Segue가 설정된 것을 알 수 있다.



### 3. Segue의 작동 순서

<img src="https://simajune.github.io/img/posting/Segue4.png" width="600px" height="400px"/>



### 4. Unwind Segue

- Unwind Segue의 사용방법은 다음과 같다.

  1. 기준 ViewController의 파일 내부에 메소드를 만든다.

     ```swift
     @IBAction func unwindSegue(segue: UIStoryboardSegue){}
     ```

  2. 위에 코드를 입력하고 난 후 Storyboard로 이동 후 기준 ViewController로 이동하게 할 Button을 드래그해서 Exit버튼에 연결한다.

  <img src="https://simajune.github.io/img/posting/Segue5.png" width="800px" height="540px"/>

  3. 코드 내부에 만든 메소드를 선택하면 완료된다.

     <img src="https://simajune.github.io/img/posting/Segue6.png" width="800px" height="540px"/>



### 5. Manual Segue

- Segue 생성 후 실행을 코드로 실행하기 위해 사용하는 Segue

  1. Storyboard의 기준 ViewController Object를 이동될 ViewController에 연결한다.

  <img src="https://simajune.github.io/img/posting/Segue7.png" width="800px" height="540px"/>

  2. 그리고 Segue Instance를 선택하여 Identifier를 설정한다.
  3. 기준 ViewController 파일을 선택하여 해당 이벤트 메소드 내에 아래의 메소드를 실행한다.

  ```swift
  performSegue(withIdentifier: "toVC", sender: nil)
  ```

