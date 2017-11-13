//UserDefault
//"contents" = 내용
//"contentsImage" = 내용의 사진
//"indexNumber" = 셀의 index

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Property
    
    //일단 보류
    var data: [[String: Any]] = [[:]]
    //일단 내용을 담고있는 배열 (이미지, 내용을 따로) 나중에 한꺼번에 데이터 저장하기로
    var contentsText: [String] = []
    var contentsImageDatas: [Data] = []
    //내용의 index 값
    var indexNumber: Int = 0
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //data = UserDefaults.standard.array(forKey: "Data") as? [[String: Any]] ?? [[:]]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentsText = UserDefaults.standard.object(forKey: "contents") as? [String] ?? []
        contentsImageDatas = UserDefaults.standard.object(forKey: "Image") as? [Data] ?? []
        self.mainTableView.reloadData()
        
    }
}

//MARK: - Extension - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.contentsLb.text = contentsText[indexPath.row]
        cell.mainImageView.image = UIImage(data: contentsImageDatas[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "indexNumber")
        performSegue(withIdentifier: "detailSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contentsText.remove(at: indexPath.row)
            UserDefaults.standard.set(contentsText, forKey: "contents")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
