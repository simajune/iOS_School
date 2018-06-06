# Network기초

### 1. Network

- 어떤 연결을 통해 컴퓨터의 자원을 공유하는 것

  <img src="https://simajune.github.io/img/posting/Network1.png" width="300px" height="200px"/>

  

### 2. 클라이언트 서버 모델(client–server model) 

- Network architecture 중 하나

- Server : Client의 요청에 따라서 데이터를 제공해 주는 컴퓨터

- Client : 서버로부터 요청한 데이터를 받는 컴퓨터

- 각각의 컴퓨터가 Client, Server의 역할에 맞게 구성되어 Network통신이 이뤄진다면 우린 이걸 클라이언트 서버 모델이라고 부를수 있다.

  <img src="https://simajune.github.io/img/posting/Network2.png" width="400px" height="100px"/>

### 3. Protocol

- 프로토콜은 컴퓨터끼리 또는 컴퓨터와 단말기 사이에 상호 통신할 때 데이터를 에러없이 원활하고 신뢰성있게 주고받기 위해 필요한 약속을 규정하는 것으로서 통신규약이라고도 한다.
- 프로토콜의 종류
  - HTTP : Hyper Text Transfer Protocol 
    - HTTP프로토콜은 어떤 메세지나 데이터를 주고 받는 통신 규약중 하나이다.
  - HTTPS : Secure Hyper Text Transfer Protocol 
  - FTP : File Transfer Protocol 
  - SMTP : Simple Mail Transfer Protocol 
  - SSH : Secure Shell 



### 4. URL

- URL(Uniform Resource Locator)은 네트워크 상에서 자원이 어디 있는지를 알려주기 위한 규약이다.

- URL 구성

  1. URL은 제일 앞에 자원에 접근할 방법을 정의해 둔 프로토콜 이름을 적는다.(ftp, http. ...)
  2. 프로토콜 이름 다음에는 프로토콜 이름을 구분하는 구분자인 ":"을 적는다.
  3. 만약 IP 혹은 Domain name 정보가 필요한 프로토콜이라면 ":" 다음에 "//"를 적는다.
  4. 프로토콜명 구분자인 ":" 혹은 "//"다음에는 프로토콜마다 특화된 정보를 넣는다.

  

### 5. URI

- 통합 자원 식별자(Uniform Resource Identifier)는 인터넷에 있는 자원을 나타내는 유일한 주소이다. URI의 존재는 인터넷에서 요구되는 기본조건으로서 인터넷 프로토콜에 항상 붙어 다닌다.
- URL vs URI
  1. URL은 URI의 한 종류이다.
  2. URL은 특정 리소스의 정확한 위치를, URI는 자원을 나타내는 식별자 역할
  3. URL : 특정자원의 위치값 (실제 파일이 있음)
     - http://naver.com/index.html 
  4. URI : Restful구조에서 특정자원을 나타내는 함수 (실제 파일은 없음)
     - http://naver.com/basefile



### 6. Rest

- REST(Representational State Transfer)는 월드 와이드 웹과 같은 분산 하이퍼 미디어 시스템을 위한 소프트웨어 아키텍처의 한 형식이다.

- 엄격한 의로 REST는 네트워크 아키텍처 원리의 모음이다. 여기서 '네트워크 아키텍처 원리'란 자원을 정의하고 자원에 대한 주소를 지정하는 방법 전반을 일컫는다.

- REST 사용 원칙

  - Resource : URI들은 쉽게 자원의 내용을 이해할 수 있게 만들어야 한다.
  - Representation : 객체와 속성을 나타내는 데이터를 JSON이나 XML구조로 전환해서 표현한다.
  - Messages : HTTP Methods를 사용한다. (GET, POST, PUT, DELETE)
  - Stateless : server와 client의 요청사항은 저장하지 않는다. client는 session상태를 유지한다.

  

### 7. HTTP Request

- URI을 이용해서 Server에 데이터를 요청한다.

- 크게 header와 body로 구조를 나눌 수 있다.

- HTTP Method를 사용해서 요청메세지를 보낸다.

  | HTTP Method | CRUD           |
  | ----------- | -------------- |
  | POST        | Create         |
  | GET         | Read           |
  | PUT         | Update/Replace |
  | PATCH       | Update/Modify  |
  | DELETE      | Delete         |

  

### 8. GET vs POST

- GET : 서버에 데이터를 요청하는 용도로 사용되는 Method. 간단한 데이터를 보내야 하면 URL뒤에 붙여서 보낸다.
- POST : Request body에 데이터를 포함시켜서 서버에 보낸다. header에 contents-type을 추가, 보내는 타입을 명시



### 9. HTTP Request 구조

```
Request-Line (ex: GET /index HTTP/1.1)
Header ( general-header | request-header | entity-header)

[message-body]
```



### 10. Contents Type

- 서버, 클라이언트 간의 어떠한 데이터를 주고 받을 수 있는지를 명시하는 타입
- 대표적인 Type
  1. Multipart Related MIME 타입
     - Content-Type : Multipart/related
  2. XML Media의 타입
     - Content-Type : text/xml
     - Content-Type : Application/xml
  3. Application의 타입
     - Content-Type : Application/json
       - JSON(JavaScript Object Notation)은 속성-값 쌍으로 이루어진 데이터 오브젝트를 전달하기 위해 인간이 읽을 수 있는 텍스트를 사용하는 개방형 표준 포맷이다.
       - 예
         - {“key”:”value”,”key”:“value”} 
         - {“username”:”userid”,"password”:“1234456”} 
     - Content-Type : Application/x-www-form-urlencode
       - 기본 데이터 타입
       - Key, Value로 이뤄져 있지만 Json과는 형태가 다르다.
       - 예
         - key=value&key=value
         - username=userid&password=1234456 
  4. 오디오 타입
     - Content-Type : audio/mpeg (MP3, MPEG)
  5. Multipart 타입
     - Content-Type : multipart/formed-data (파일 첨부)
       - 복잡한 데이터 향식을 보낼 때의 데이터 타입
       - 파일 전송시 주로 사용