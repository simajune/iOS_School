# UITableView

### 1. UITableView

- 리스트의 형태로 정보를 보여주는 View

<img src="https://simajune.github.io/img/posting/TableView1.png" width="375px" height="667px"/>

### 2. Style

 1. Plain
   - 기본적인 TableView
   - 여러개의 Section을 가질 수 있다
   - 한 Section에는 여러개의 Row를 포함하고 있다
   - 각각의 Section에는 Section을 표시하는 header, footer title을 사용할 수 있다
   - Section을 빠르게 검색할 수 있는 네비게이터 바를 index list라고 부른다

<img src="https://simajune.github.io/img/posting/TableView1.png" width="375px" height="667px"/>

2. Group
   - 각 Section을 Group의 형태로 나타내는 TableView
   - 데이터의 디테일한 정보를 표현할 때 많이 사용된다

<img src="https://simajune.github.io/img/posting/TableView2.png" width="375px" height="667px"/>



### 3. Protocol

- DataSource

  - 프로토콜을 사용하여 TableView에서 보여줄 데이터를 관리할 대리인의 역할을 정의해 둔 것
  - 역할
    - @requires
      - TableView의 각 섹션별 열의 개수를 설정
      - Row별 Cell객체
    - @optional
      - TableView 섹션의 개수를 설정

```swift
public protocol UITableViewDataSource : NSObjectProtocol {
    
@available(iOS 2.0, *)
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:

    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
@available(iOS 2.0, *)
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
@available(iOS 2.0, *)
optional public func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if
not implemented
    
@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, titleForHeaderInSection section:
Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
    
@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, titleForFooterInSection section:
Int) -> String?
```



- Delegate
  - 프로토콜을 사용하여 TableView의 대리자로써의 수행할 수 있는 역할들을 정의해 둔 것
  - 역할
    - 헤더 또는 풋터의 높이를 설정
    - 헤더 또는 풋터 뷰를 제공
    - 셀을 선택하였을 때 수행할 동작 관리
    - 셀의 삭제될 때의 동작 등의 관리

```swift
public protocol UITableViewDelegate : NSObjectProtocol, UIScrollViewDelegate {
    
// Display customization
@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    
@available(iOS 6.0, *)
optional public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
…
    
// Variable height support
@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat

@available(iOS 2.0, *)
optional public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
```



### 4. IndexPath

- Cell의 위치를 나타낼 DataType으로 Section정보와 해당 섹션에서의 Row정보를 가지고 있다.

```swift
extension IndexPath {
	public init(row: Int, section: Int)
	public var section: Int
	public var row: Int
}
```



### 5. TableView 만들기

 1. TableView UI 생성

    - TableView 화면을 이동 후 AutoLayout 설정
    - TableView Cell 추가

    <img src="https://simajune.github.io/img/posting/TableView3.png" width="375px" height="200px"/>

    <img src="https://simajune.github.io/img/posting/TableView4.png" width="375px" height="667px"/>

    - TableView Cell Identofier 설정

    <img src="https://simajune.github.io/img/posting/TableView5.png" width="300px" height="350px"/>

    - DataSource 연결

    <img src="https://simajune.github.io/img/posting/TableView6.png" width="375px" height="450px"/>

 2. DataSource 함수 만들기 (section, row 갯수)

    ```swift
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //섹션별 row의 갯수 리턴 코드 구현
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    	//cell 구현
    }
    ```

    

 3. 각 indexPath에 해당하는 Cell 설정

    - TableViewCell Reusable 

    ```swift
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    	//cell instance 가져오기
    	let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse ID", for: indexPath)
    	//Cell Data 설정
    	cell.textLabel?.text = "\(indexPath.row)"
    	return cell
    }
    ```

    - 재사용(reuse)

      - TableView는 한줄 한줄이 광장히 비슷한 모습을 가지고 있다.
      - 수백개의 테이블 리스트가 있다고 가정할 때...
      - 공통적인 레이아웃을 사용하여 여러번 화면을 보여줄 필요가 있는 경우 Cell을 재사용

      <img src="https://simajune.github.io/img/posting/TableView1.png" width="375px" height="667px"/>



### 5. UITableViewCell

- 텍스트, 이미지 그리고 다른 종류의 컨텐츠를 보여준다
- 일반 셀과 선택된 셀을 백그라운드 view로 구분한다
- 셀은 악세사리 view를 가지고 있다
- ContentView
  - textLabel
  - detailTextLabel
  - imageView
- accessoryView
  - None
  - DisclosureIndicator
  - DetailDisclosureButton
  - Checkmark
  - DetailButton

<img src="https://simajune.github.io/img/posting/TableView7.png" width="500px" height="300px"/>