//
//  TableViewController.swift
//  171010_UIViewController
//
//  Created by SIMA on 2017. 10. 10..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView: UITableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "This is cell \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let secondVC1 = SecondViewController()
        //let storyboard = UIStoryboard(name: "Substoryboard", bundle: nil)
        //var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        if indexPath.row % 2 == 0 {
//            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        }else {
//            storyboard = UIStoryboard(name: "Substoryboard", bundle: nil)
//        }
        
        
        guard let secondVC2 = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        present(secondVC2, animated: true, completion: nil)
    }

}
