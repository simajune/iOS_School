# AutoLayout

### 1. AutoLayout

- AutoLayout은 각각의 View의 Size와 위치를 제약사항을 통해서 유동적으로 계산하여 표현하는 방법



### 2. Auto Layout VS Frame-Based Layout 차이점

<img src="https://simajune.github.io/img/posting/AutoLayout1.png" width="700px" height="450px"/>

- Frame-Based Layout은 View의 시작점과 그 시작점에서의 Width와 Height를 설정하여 View를 표현한다.
- AutoLayout은 View의 특정 제약사항을 주어 View를 표현한다.



### 3. Constraint

- 각 View의 거리, 길이, 위치 등을 표현하기 위한 제약 

  <img src="https://simajune.github.io/img/posting/AutoLayout2.png" width="650px" height="200px"/>

  - Multiplier : 비율을 통한 레이아웃 설정을 위한 속성
  - Constant : 일정한 간격을 유지하기 위한 속성

  

### 4. Attribute(속성) 

<img src="https://simajune.github.io/img/posting/AutoLayout3.png" width="600px" height="500px"/>

- Size Attribute

  1. Width
  2. Height

- Location Attribute

  1. Leading

  2. Trailing
  3. Top
  4. Bottom
  5. Vertical
  6. Horizontal




### 5. 제약사항 만들기

- Using Storyboard

  - Control + Drag

    1. <img src="https://simajune.github.io/img/posting/AutoLayout4.png" width="500px" height="250px"/>

    - Drag를 어떤 위치에 놓는냐에 따라 제약의 메뉴가 달라진다.

    2. <img src="https://simajune.github.io/img/posting/AutoLayout5.png" width="500px" height="200px"/>

    

- Layout margin

  - SuperView의 가장자리와 SubView와의 간격이 유지되도록 설정된 내부 패딩 값
  - 기본적으로 UIView 의 내부에 8Point의 여백을 가지고 있다
  - Interface Builder에서는 변경할 수 없으며 UIView.layoutMargins 프로퍼티를 통해 변경이 가능하다



- 제약사항 만들기 팁
  - 각 View의 주변의 모든 제약사항이 만족해야한다.
  - 가로제약, 세로제약을 확인
  - 중복된 제약은 제거한다.
  - 화면 배치의 기준 View를 정해서 연관된 제약사항을 만들시 수정에 따른 변경 고려



### 6. StackView

- 제약 없이 View를 자동배치

- StackView의 하위뷰로 추가시 Option에 따라 View가 자동으로 배치

- iOS9 이후에 사용가능

- Horizontal Stack View와 Vertical Stack View로 나눠져 있다

  <img src="https://simajune.github.io/img/posting/AutoLayout6.png" width="200px" height="250px"/>

### 7. StackView 구조

<img src="https://simajune.github.io/img/posting/AutoLayout7.png" width="700px" height="500px"/>

- Alignment

  - Fill, Top, Center, Bottom

- Distribution

  - Fill
  - Fill Equally
  - Fill Proportionally
  - Equal Spacing
  - Equal Centering

  



