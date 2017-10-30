
import UIKit

class MainViewController: UIViewController,UITableViewDataSource {

    //MARK: - Variable
    @IBOutlet weak var tableView: UITableView!
    var dataCenter: DataCenter?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        dataCenter = DataCenter()
        tableView.reloadData()
    }

    //MARK: - TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCenter?.membersData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MemberTableViewCell

        let memberData: MemberData = (dataCenter?.membersData[indexPath.row])!
        cell.data = memberData
        
        cell.textLabel?.text = memberData.nickname
        cell.detailTextLabel?.text = memberData.myProfileDescription
        cell.imageView?.image = UIImage(named: (memberData.profileImage))

        return cell
    }
    
    //MARK: - Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? MemberTableViewCell else { return }
        
        guard let nextVC = segue.destination as? DetailViewController else { return }
        
        nextVC.data = cell.data
    }

    
    
    
    
    
    
    

}

