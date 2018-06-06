# iOS Network

### 1. URL Load System

- URL을 통해서 컨텐츠의 리소스를 받아올 수 있는 가장 일반적인 방법으로 URLSession을 사용한다.

  <img src="https://simajune.github.io/img/posting/Network3.png" width="600px" height="400px"/>

  

### 2. URL Request 

- URL Request System에서 요청에 대한 추가 정보를 가지고 있는 클래스

- URL 및 프로토콜별 속성을 캡슐화 한 클래스

- 요청하는 정보에 대해서만 캡슐화하고 있고 서버에 요청하는 역할은 URLSession을 통해서 한다.

- URLRequest 주요 항목

  ```swift
  public init(url: URL, cachePolicy: URLRequest.CachePolicy = default, timeoutInterval: TimeInterval = default)
  var cachePolicy: URLRequest.CachePolicy
  var timeoutInterval: TimeInterval
  var networkServiceType: URLRequest.NetworkServiceType
  var httpMethod: String?
  var httpBody: Data?
  func addValue(_ value: String, forHTTPHeaderField field: String)
  func setValue(_ value: String?, forHTTPHeaderField field: String)
  ```

  

### 3. URLSession

- URL Loading System에서 컨텐츠를 검색하는 가장 일반적인 클래스

- URLSession은 HTTP requests를 통해 데이터를 보내고 받는데 API를 제공하는 클래스

- App이 실행되지 않은 상태에서도 백드라운드에서 Upload 및 Download기능을 제공.

- 지원가능 URL

  - File Transfer Protocol (ftp://)
  - Hypertext Transfer Protocol (http://)
  - Hypertext Transfer Protocol with encryption (https://)
  - Local file URLs (file:///)
  - Data URLs (data://)

- URLSession 주요 항목

  ```swift
  class var shared: URLSession { get }
  init(configuration: URLSessionConfiguration)
  
  func dataTask(with request: URLRequest, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
  
  func dataTask(with url: URL, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
  
  func uploadTask(with request: URLRequest, from bodyData: Data?, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionUploadTask
  
  func downloadTask(with request: URLRequest, completionHandler:@escaping(URL?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDownloadTask
  ```

  

### 4. URLSessionTask

- URLSessionTask는 URLSession의 작업 하나(Task)를 나타내는 추상클래스로 URLSession을 통해서만 생성 가능(ex : dataTask(With:))

  <img src="https://simajune.github.io/img/posting/Network4.png" width="400px" height="250px"/>

- NSURLSessionDataTask: HTTP GET요청으로 서버로부터 데이터를 가져오는 작업을 수행.

- NSURLSessionUploadTask: 디스크로부터 웹서버로 파일을 업로드하는 작업을 수행합니다. 주로 HTTP POST, PUT 메소드를 이용.

- NSURLSessionDownloadTask: 서버로부터 파일을 다운로드하는 작업을 수행.

  

### 5. URLSessionConfiguration 

- URLSessionConfiguration은 Session의 설정의 관련된 클래스. 다음 3가지 중 하나 값으로 생성되며 타임아웃, 캐시 정책 등의 프로퍼티를 설정 가능

  1. default: 디폴트 configuration 객체를 생성합니다. 디폴트 값으로는 파일로 다운로드 될 때를 제외하고는 Disk에 캐쉬를 저장하며 키체인에 자격을 저장.
  2. ephemeral: 디폴트 configuration과 설정은 동일하다. session관련 데이터가 메모리에 올라감.
  3. background: Session이 백그라운드에서 다운로드 작업과 업로드 작업을 마져 수행할 수 있도록 함.

  

### 6. 네트워크 실행 순서

1. URLRequest 인스턴스 생성 (요청생성)
2. URLSession 인스턴스 생성 (URLConfiguration 설정은 옵션)
3. URLSession의 메소드를 통해 URLSessionTask 생성
4. Task 실행: 네트워크 요청
5. 요청한 task에 대한 응답(repond)처리 (Delegate or Closure)
6. JSONSerialization or JSONDecoder를 통해 알맞은 데이터 인스턴스로 변환