//
//  MainViewController.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 17..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var result: [PostModel] = []
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var contentTablVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        contentTablVIew.refreshControl = refreshControl
        
        NetworkManager.shared.requestGetPosts { (isSuccess, resultData, error) in
            if isSuccess {
                self.result = resultData as! [PostModel]
                self.contentTablVIew.reloadData()
            }else{
                
            }
            
        }
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        NetworkManager.shared.requestGetPosts { (isSuccess, resultData, error) in
            if isSuccess {
                self.result = resultData as! [PostModel]
            }
        }
        self.contentTablVIew.reloadData()
        refreshControl.endRefreshing()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(result.count)
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let imageData: Data? = try? Data(contentsOf: URL(string: result[indexPath.row].imgCoverUrl!)!)
        cell.contentsLb.text = result[indexPath.row].title
        cell.mainImageView.image = UIImage(data: imageData!)
        return cell
    }
    
    
}
