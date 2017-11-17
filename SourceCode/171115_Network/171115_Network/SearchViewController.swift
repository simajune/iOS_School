
import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {

    var searchController: UISearchController?
    
    var cityList: [CityData] = []
    var cityNameArray: [String] = []
    var filteredCityNameArray: [String] = []
    var cityName: String = "Seoul"
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var citySerchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.loadingIndicator.startAnimating()
        //json 데이터를 글로벌 쓰레드로 값을 받아옴
        DispatchQueue.global().async {
            if let path = Bundle.main.path(forResource: "CityList", ofType: "json"),
                let contents = try? String(contentsOfFile: path),
                let data = contents.data(using: .utf8) {
                let cityDic = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                for city in cityDic {
                    self.cityList.append(CityData(cityDic: city)!)
                }
                DispatchQueue.main.async {
                    self.loadingIndicator.stopAnimating()
                    self.setupSearchBar()
                    self.cityTableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //기본적인 UI 셋팅
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        cityTableView.backgroundColor = UIColor(red: 78/255, green: 85/255, blue: 94/255, alpha: 0.9)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        var list:[String] = []
        let searchText = searchController.searchBar.text!
        list.removeAll()
        
        if searchText.count > 0
        {
            let item = DispatchWorkItem {[unowned self] in
                for index in 0..<self.filteredCityNameArray.count
                {
                    let cityName = self.filteredCityNameArray[Int(index)]
                    if cityName.hasPrefix(searchText)
                    {
                        list.append(self.filteredCityNameArray[Int(index)])
                    }
                }
                DispatchQueue.main.async {
                    self.cityNameArray = list
                }
            }
            DispatchQueue.global().async(execute: item)
        }
    }
    
    //searchbar 셋팅
    func setupSearchBar() {
        for list in 0 ... (cityList.count - 1){
            cityNameArray.append(cityList[list].city)
        }
        filteredCityNameArray = cityNameArray
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackSegue" {
            let destinationViewController = segue.destination as! ViewController
            destinationViewController.cityName = cityName
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityCell
            cell.cityNameLb.text = cityNameArray[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = cityTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityCell
        cityName = cityNameArray[indexPath.row]
        
        self.cityName = cityName.replacingOccurrences(of: " ", with: "%20")
        print(cityName)
        performSegue(withIdentifier: "BackSegue", sender: self)
    }
}
