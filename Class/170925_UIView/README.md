# UIView

### 1. UIView란

- 가장 기본이 되는 View
- UIComponent들의 조합으로 화면이 구성되며 UIView를 상속 받았다. 즉, iOS 화면 구성은 UIView의 집합으로 되어 있다.

### 2. UIView 만들기

- UIView를 만들기 위해선 최소 두가지는 필수로 해야한다. 첫째는 UIview라는 객체를 어디에 어떠한 크기를 갖는지 선언을 해야 하고 두번째로는 이 만들어진 객체를 어디에 넣을지 선언을 해야한다. 

  ```swift
  //UIView 객체 생성
  let mainview: UIView = UIView(frame: CGRect(x: 0 ,y: 0 ,width: 100, height: 100))	
  //view 추가
  view.addSubview(mainview)
  ```

  위에 코드처럼 하게 되면 좌표가 (0,0)이고 크기가 100x100인 view를 만들고 이 view를 전체 view안에 추가 하겠다는 뜻이다.

  ![17092502](https://github.com/simajune/iOS_School/blob/master/Img/17092503.png)


- 하지만, 이렇게 하고 시뮬레이션을 켜보면 위와 같이 화면에 아무것도 나타나지 않을 것이다. 왜냐하면 코드에서 뷰의 배경색을 지정해주지 않았기 때문에 화면에는 투명한 뷰가 있기때문에 눈으로는 확인을 할 수가 없다. 그래서 뷰를 확인하기 위해서는 뷰의 배경색을 지정해주면 된다.

  ```swift
   //UIView 객체 생성
  let mainView: UIView = UIView(frame: CGRect(x: 0 ,y: 0 ,width: 100, height: 100))	
  //view의 배경색 설정
  mainView.backgroundColor = UIColor.lightgray
  //view 추가
  view.addSubview(mainView)
  ```

  ![17092502](https://github.com/simajune/iOS_School/blob/master/Img/17092504.png)

- 뷰에 대한 설정은 UIView class에 보면 수 많은 Property들이 있다. 이것을 변경하면 뷰에 대한 설정을 개발자의 맞게 변경하면 된다.