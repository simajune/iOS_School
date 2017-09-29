
import UIKit

class Main: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    // MARK: - Variable
    var data = [String]()
    // Variable_End
    
    //MARK: - Status Bar delete
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        data = UserDefaults.standard.object(forKey: "Data") as? [String] ?? [String]()
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        Cell.titleLB.text = data[indexPath.row]
        return Cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            UserDefaults.standard.set(data, forKey: "Data")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "Order")
        performSegue(withIdentifier: "ToMemo", sender: self)
    }
    // Table View_End

    //MARK: - ButtonAction
    @IBAction func addButton(_ sender: Any) {
        UserDefaults.standard.set(-1, forKey: "Order")
    }
}
