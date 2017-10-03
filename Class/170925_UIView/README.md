# UIView

### 1. UIView란

- 가장 기본이 되는 View
- UIComponent들의 조합으로 화면이 구성되며 UIView를 상속 받았다. 즉, iOS 화면 구성은 UIView의 집합으로 되어 있다.

### 2. UIView 만들기

- UIView를 만들기 위해선 최소 두가지는 필수로 해야한다. 첫째는 UIview라는 객체를 어디에 어떠한 크기를 갖는지 선언을 해야 하고 두번째로는 이 만들어진 객체를 어디에 넣을지 선언을 해야한다. 

  ```swift
  //UIView 객체 생성
  let view: UIView = UIView(frame: CGRect(x: 0 ,y: 0 ,width: 100, height: 100))	
  //view 추가
  view.addSubview(view)
  ```

  위에 코드처럼 하게 되면 좌표가 (0,0)이고 크기가 100x100인 view를 만들고 이 view를 전체 view안에 추가 하겠다는 뜻이다.