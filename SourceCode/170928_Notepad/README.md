# NotePad

### 1. 동작

<img src="https://simajune.github.io/img/posting/NotePad.gif" width="600px" height="400px"/>



### 2. 코드 

- 이번 Nodpad를 만들기 위해서는 가장 기본적인 UIKit는 UITableView이고 그리고 내용을 저장을 UserIterface를 통해 할것이다.  우선 중요한 것은 테이블뷰를 이런식으로 만들었다. 

  <img src="https://simajune.github.io/img/posting/NotePad1.png" width="375px" height="667px"/>

  UI는 스토리보드를 이용해 만들것이다.

- 이렇게 만든 테이블뷰에 설정해줘야 할것이 2가지 있는데 한가지는 UITableViewDataSource이고 나머지 한가지는 UITableViewDelegate이다. 아래는 UITableViewDataSource의 설정 부분이다.

  ```swift
      // MARK: - Table View
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return data.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
          Cell.titleLB.text = data[indexPath.row]
          return Cell
      }
  ```

  위의 메소드는 테이블 뷰의 셀의 갯수를 나타내는 것으로 return 값을 Int로 반환하게 된다. 그리고 밑의 메소드는 셀의 데이터를 설정하는 부분으로 셀이 가지고 있는 데이터를 어떤게 보여줄지에 대해 설정하게 된다.

  ```swift
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          UserDefaults.standard.set(indexPath.row, forKey: "Order")
          performSegue(withIdentifier: "ToMemo", sender: self)
      }
  ```

  위의 메소드는 UITableViewDelegate 통해 설정하는 메소드로 셀을 터치했을 때의 상태를 파악하여 어떤 일을 하게 될지 설정하는 것이다. 

- Notpad에서 메모를 추가하려면 메인뷰에서 오른쪽 위의 +버튼을 누르면 글을 쓸수 있는 뷰로 present가 된다. 그 뷰에는 텍스트뷰를 설정해서 내용을 입력하고 왼쪽 위의 < 버튼을 누르면 내용이 UserInterface에 저장이 되고 그 내용을 메인에서 보여주게 된다.

  ```swift
  override func viewDidLoad() {
          super.viewDidLoad()
          data = UserDefaults.standard.object(forKey: "Data") as? [String] ?? [String]()
          order = UserDefaults.standard.object(forKey: "Order") as! Int
          if order >= 0 {
              contentTextView.text = data[order]
          } else {
              contentTextView.text = "..."
          }
      }
      
      func textViewDidBeginEditing(_ textView: UITextView) {
          if contentTextView.text == "" {
              contentTextView.text = "Placeholder text ..."
              contentTextView.textColor = UIColor.lightGray
          }
      }

      //MARK: - BtnAction
      @IBAction func saveButton(_ sender: Any) {
          order = UserDefaults.standard.integer(forKey: "Order")
          if order >= 0 {
              
              data.remove(at: order)
              data.insert(contentTextView.text, at: 0)
              UserDefaults.standard.set(data, forKey: "Data")
          } else {
              data.insert(contentTextView.text, at: 0)
              UserDefaults.standard.set(data, forKey: "Data")
          }
      }
  ```

  이 코드는 메모하는 뷰의 코드이다. 우선 이 뷰에 처음 들어올 땐 메인 뷰에서 + 버튼를 눌렀는지 아니면 셀을 눌렀는지 확인하고 셀을 누르면 셀의 내용을 보여주고 아니면 "..."을 텍스트 뷰에 보여주고 메모를 할수 있게 하고 메모를 입력하고 내용을 배열의 0번 index에 넣고 UserInterface에 넣고 저장한다. 0번 index에 넣는 이유는 최신 글이 제일 첫번째에 나오게 하기 위해서다.

  ​

### 3. UI 사용

- UIButton
- TableView
- TextView
- UserInterface

