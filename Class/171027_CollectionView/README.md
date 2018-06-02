# ollectionView

### 1. CollectionView란

- UICollectionView는 데이터 항목의 정렬된 컬렉션을 관리하고 사용자가 정의한 레이아웃을 사용하여 데이터 항목을 제공하는 객체

- CollectionView를 구현하는데 필요한 클래스와 프로토콜

  | Manager                    | Layout                           | Protocol                   | Flow Layout                        | Presentation                 |
  | -------------------------- | -------------------------------- | -------------------------- | ---------------------------------- | ---------------------------- |
  | UICollectionView           | UICollectionViewLayout           | UICollectionViewDataSource | UICollectionViewFlowLayout         | UICollectionViewReusableView |
  | UICollectionViewController | UICollectionViewLayoutAttributes | UICollectionViewDelegate   | UICollectionViewDelegateFlowLayout | UICollectionViewCell         |
  |                            | UICollectionViewUpdateItem       |                            |                                    |                              |

<img src="https://simajune.github.io/img/posting/CollectionView1.png" width="400px" height="300px"/>

### 2. Layout

- <img src="https://simajune.github.io/img/posting/CollectionView2.png" width="450px" height="300px"/>



### 3. Section Layout

<img src="https://simajune.github.io/img/posting/CollectionView3.png" width="450px" height="300px"/>



### 4. FlowLayout

- UICollectionViewFlowLayout Class에 정의
- Scroll Direction
  - Vertical
  - Horizontal

<img src="https://simajune.github.io/img/posting/CollectionView4.png" width="500px" height="200px"/>



### 5. Flow Layout Attributes 정의

- UICollectionViewDelegateFlowLayout Protocol 이용

- UICollectionViewDelegate가 정의된 인스턴스에서 작성

  ```swift
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
  ```

  

### 6. Item Size

<img src="https://simajune.github.io/img/posting/CollectionView4.png" width="500px" height="200px"/>

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
```



### 7. Item Spacing

<img src="https://simajune.github.io/img/posting/CollectionView5.png" width="500px" height="150px"/>

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
```



### 8. Line Spacing

<img src="https://simajune.github.io/img/posting/CollectionView6.png" width="400px" height="300px"/>

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
```



### 9. Section Inset

<img src="https://simajune.github.io/img/posting/CollectionView7.png" width="400px" height="300px"/>

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
```



### 10. Protocol

- UICollectionViewDataSource

  ```swift
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  
  optional public func numberOfSections(in collectionView: UICollectionView) -> Int
  ```

- UICollectionViewDelegate

  ```swift
  optional public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
  
  optional public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
  
  optional public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)
  
  optional public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
  
  optional public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool // called when the user taps on an already-selected item in multi-select mode
  
  optional public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
  
  optional public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
  ```

- UICollectionViewDataSourcePrefetching

  