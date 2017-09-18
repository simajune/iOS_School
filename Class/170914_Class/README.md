# 클래스와 객체

- 객체지향에서 제일 중요한  것이 바로 클래스이다. 

### 1. 클래스의 구조

- 프로퍼티 (변수, 상수)
- 메서드

![image](https://github.com/simajune/iOS_School/tree/master/Img/17091401.png)

** **

#### 프로퍼티

- 객체가 가지고 있는 속성이고 값들을 연결 시킨다. 저장 속성은 상수나 변수값으로 인스턴스의 프로퍼티로 저장된다.
- 기본적인 변수나 상수와 같이 선언이 된다.

#### 메서드

- 메서드는 클래스의 함수적 기능을 하고 타입의 의존적인 함수이다.

###2. 클래스를 통한 인스턴스 생성

- 기본 문법

  ```swift
  class Subject
  {
  var name:String = “소프트웨어 입문”
  var score:Int = 95
  var gradeNumber:Int = 3
  var grade:String = “A+”
  }

  var introductionSoftwaer:Subject = Subject()
  ```

### 3. 클래스의 상속

- Subclassing

- 기존에 구현되어 있는 클래스를 확장, 변형

- 부모 클래스 (super class, parent, class)와 자식 클래스(subclass, child class)로 관계를 표현

- 상속 할수록 더 확장되는 구조

- 상속의 표현 문법

  ```swift
  class UniversityStudent: Student {
  }
  ```

