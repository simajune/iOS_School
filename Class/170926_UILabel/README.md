# UILabel

### 1. UILabel란

- 문자를 출력하는 View



### 2. UILabel 만들기

- UILabel은 UIView를 상속 받기 때문에 UILabel를 만들기 위해서는 UIView와 마찬가지로 최소 두가지는 필수로 해야한다. 첫째는 UILabel라는 객체를 어디에 어떠한 크기를 갖는지 선언을 해야 하고 두번째로는 이 만들어진 객체를 어디에 넣을지 선언을 해야한다. 하지만 그렇게 하면 UIVIew와 똑같은 형태가 된다. 그래서 차이를 주기 위해서는 UILabel에 어떠한 문자(텍스트)를 넣을지 설정해줘야 한다.

  ```swift
  //UILabel 객체 생성
  let lb: UILabel = UILabel(frame: CGRect(x: 0 ,y: 100 ,width: 200, height: 100))
  //텍스트 설정
  lb.text = "Tejay의 개발이야기"
  //UILabel 추가
  view.addSubview(lb)
  ```

  위에 코드처럼 하게 되면 좌표가 (0,100)이고 크기가 200x100인 view를 만들고 이 view를 전체 superview안에 추가하고 이 view 텍스트를 "Tejay의 개발이야기"라고 설정한다라는 뜻이다. 이렇게 설정한 후 시뮬레이션을 켜보면 아래의 그림처럼 나타나게 된다.

  ![17092604](https://simajune.github.io/img/posting/17092604.png)



