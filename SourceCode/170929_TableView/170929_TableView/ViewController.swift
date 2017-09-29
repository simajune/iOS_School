
import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    let poketmon: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView: UITableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poketmon.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = poketmon[indexPath.row]
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.setImgName(name: poketmon[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = poketmon[indexPath.row]
        let alertC: UIAlertController = UIAlertController(title: "테이블 테스트", message: "지금 \(name) 포켓몬이 선택 되었습니다", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertC.addAction(action)
        present(alertC, animated: true, completion: nil)
    }
    
    

}

