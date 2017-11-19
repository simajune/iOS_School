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
    @IBOutlet weak var writeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        contentTablVIew.refreshControl = refreshControl
        setupView()
        NetworkManager.shared.requestGetPosts { (isSuccess, resultData, error) in
            if isSuccess {
                
                DispatchQueue.main.async {
                    self.result = resultData as! [PostModel]
                    self.contentTablVIew.reloadData()
                }
                
                
            }else{
                
            }
            
        }
    }
    
    func setupView() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "메인입니다"
        
        writeButton.layer.cornerRadius = (writeButton.bounds.height) / 2
        writeButton.layer.borderColor = UIColor.lightGray.cgColor
        writeButton.layer.borderWidth = 2
        
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

extension MainViewController: UITableViewDelegate {
    
}
