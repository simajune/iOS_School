//
//  MainViewController.swift
//  171116_NetworkTest
//
//  Created by SIMA on 2017. 11. 17..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var titleLb: UILabel = {
       let lb = UILabel()
        lb.backgroundColor = .black
        
        return lb
    }()
    
    var result: [PostModel] = []
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var contentTablVIew: UITableView!
    @IBOutlet weak var writeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func auto() {
        titleLb.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10)
        titleLb.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 10)
        titleLb.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10)
        titleLb.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        contentTablVIew.refreshControl = refreshControl
        
        NetworkManager.shared.requestGetPosts { (isSuccess, resultData, error) in
            if isSuccess {
                DispatchQueue.main.async {
                    self.result = resultData as! [PostModel]
                    self.contentTablVIew.reloadData()
                }
            }else{
                
            }
        }
        setupView()
    }
    
    func setupView() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 207/255, blue: 246/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "메인입니다"
        
        writeButton.layer.cornerRadius = (writeButton.bounds.height) / 2 + 2
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
