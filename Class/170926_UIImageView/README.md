# UIImageView

### 1. UIImageView란

- 사진이나 그림을 표시하기 위한 View



### 2. UIImageView 만들기

- UIImageView는 UIView를 상속 받기 때문에 UIImageView를 만들기 위해서는 UIView와 마찬가지로 최소 두가지는 필수로 해야한다. 첫째는 UIImageView라는 객체를 어디에 어떠한 크기를 갖는지 선언을 해야 하고 두번째로는 이 만들어진 객체를 어디에 넣을지 선언을 해야한다. 하지만 그렇게 하면 UIVIew와 똑같은 형태가 된다. 그래서 차이를 주기 위해서는 UIImageView에 어떤 그림이나 사진이 들어가는 정해주어야 한다.

  ```swift
  //UIImageView 객체 생성
  let imgview: UIImageView = UIImageView(frame: CGRect(x: 0 ,y: 100 ,width: 100, height: 100))
  //이미지 설정
  imgView.image = UIImage(named: "cat1.jpg")
  //view에 추가
  view.addSubview(imgview)
  ```

  위에 코드처럼 하게 되면 좌표가 (0,100)이고 크기가 100x100인 view를 만들고 이 view를 전체 view안에 추가하고 이 view 이미지를 "cat1.jpg"라는 이름을 가진 이미지를 보여줄거라는 뜻이다.

  ![17092502](https://simajune.github.io/img/posting/17092601.png)


- 이미지를 나타내기 위해선 이미지를 프로젝트 안에 넣어줘야하는데 넣는 방법은 2가지로 나눌 수 있다. 첫번째는 프로젝트 안에 드래그해서 넣는 방법과 두번째는 Asset에 넣는 방법이다. 우선 첫번째는 아래의 그림처럼 하면 된다.

  ![17092502](https://simajune.github.io/img/posting/17092602.png)

- 두번째는 프로안에 `Assets.xcassets`을 누르게 되면 화면 처럼 나오는데 이곳에 이미지를 드래그해서 넣어주면 된다.

  ![17092502](https://simajune.github.io/img/posting/17092603.png)

- 그리고 이미지는 확장장가 png파일 경우에는 이름을 넣을 때 확장자 명은 생략해도 이미지가 출력이 됩니다.