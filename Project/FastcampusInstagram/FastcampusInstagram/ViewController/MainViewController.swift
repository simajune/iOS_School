

import Firebase
import UIKit

class MainViewController: UIViewController {
    
    var ref: DatabaseReference!
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.dataSource = self
        InstaDatabase.main.loadData()
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadComplete), name: .myNotification, object: nil)
        
        self.view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        let image = UIImage(named: "instagram")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    @objc func loadComplete() {
        print(InstaDatabase.main.posts)
        postTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("didview")
        InstaDatabase.main.loadData()
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadComplete), name: .myNotification, object: nil)
        postTableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InstaDatabase.main.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        
        let instaData = InstaDatabase.main

        cell.userProfileImgView.setupImage(photoID: InstaDatabase.main.PhotoID)
        cell.usernameLabel.text = instaData.posts[indexPath.row].user
        cell.postImgView.setupImage(photoID: InstaDatabase.main.posts[indexPath.row].photoID)
        print(InstaDatabase.main.posts[indexPath.row].photoID)
        cell.postContent.text = instaData.posts[indexPath.row].content

        return cell
    
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
}

extension NSNotification.Name {
    static let myNotification = NSNotification.Name("myNotification")
}

extension UIImageView {
    func setupImage(photoID: String?) {
        
        guard let photoID = photoID else {
            self.image = nil
            return
        }
        let urlStr = URL(string: photoID)
        print("ID        asdasd", photoID)
        if let imgData = try? Data(contentsOf: urlStr!) {
            
            self.image = UIImage(data: imgData)
        }
        
    }
}
