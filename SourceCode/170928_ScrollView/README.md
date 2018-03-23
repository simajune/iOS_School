# UIScrollView

### 1. UIScrollView란

- 원래의 View 사이즈보다 큰(확장) 뷰를 보기 위한 뷰
- ScrollView를 이루기 위해서는 ScrollView와 ContentView가 꼭 필요하다.
- ContentView는 추가된 객체에 의해 뷰의 크기가 정해진다.

<img src="https://simajune.github.io/img/posting/ScrollView.png" width="375px" height="667px"/>



### 2. UIScrollView 만들기

1. 스크롤뷰를 만들기
2. 컨텐트뷰를 스크롤뷰에 추가하기
   - UIView 추가하기
   - 크기 지정
3. 스크롤의 방향을 정하는 방법은 상하좌우로 움직이게 만들기 위해선 컨텐트뷰의 너비와 높이를 스크롤뷰보다 크게 만들고 좌우는 컨텐트뷰의 높이를 같게 상하는 컨텐트뷰의 너비를 같게 만들면 된다. 



### 3. UIScrollView 실습

<img src="https://simajune.github.io/img/posting/ScrollView1.png" width="1125px" height="667px"/>

- 우선 위의 스크롤뷰를 만들기 위해선 스크롤이 좌우로 움직여야 하므로 스크롤뷰의 높이와 컨텐트뷰의 높이가 같아야하고 스크롤뷰의 너비는 컨틴트뷰의 너비의 3배가 되면 된다.

<img src="https://simajune.github.io/img/posting/ScrollView2.png" width="600px" height="400px"/>

```swift
//스크롤뷰 만들기
scrollView =  UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//컨텐트뷰 만들기
scrollView.contentSize = CGSize(width: 3*view.frame.size.width, height: view.frame.size.height)
//스크롤뷰의 바운스 효과 적용
scrollView.bounces = true
//스크롤뷰의 페이징 효과 적용
scrollView.isPagingEnabled = false
//스크롤뷰 추가
view.addSubview(scrollView)
```

- 그리고 이미지를 보면 첫번째는 파랑, 두번째는 녹색, 세번째는 빨강으로 만들어야한다. 따라서, 세개의 뷰를 컨텐트뷰에 추가하면 되는데 추가할때 x의 값을 첫번째 뷰는 0, 두번째 뷰는 한개의 뷰의 너비 만큼 옆에 세번째 뷰는 두개의 뷰의 너비만큼 옆으로 떨어뜨린 후에 추가해야 한다.

```swift
//첫번째 파란색 뷰
let firstView: UIView = UIView(frame: CGRect(x: 0, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
firstView.backgroundColor = UIColor.blue
scrollView.addSubview(firstView)
//두번째 녹색 뷰        
let secondView: UIView = UIView(frame: CGRect(x: view.frame.size.width, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
secondView.backgroundColor = UIColor.green
scrollView.addSubview(secondView)
//세번째 빨간색 뷰        
let thirdView: UIView = UIView(frame: CGRect(x: 2*view.frame.size.width, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
thirdView.backgroundColor = UIColor.red
scrollView.addSubview(thirdView)
```

