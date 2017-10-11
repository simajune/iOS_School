//
//  ViewController.swift
//  171011_NavigationController
//
//  Created by SIMA on 2017. 10. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    @IBOutlet weak var titleLB: UILabel!
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    override var prefersStatusBarHidden: Bool { return true }
    
    var heightArray:[Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in 0 ... 19 {
            heightArray.append(false)
        }
 
        table.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let pushBtn = UIButton()
        pushBtn.setTitle("Next", for: .normal)
        pushBtn.setTitleColor(.black, for: .normal)
        pushBtn.addTarget(self, action: #selector(self.pushButtonHandler(_:)), for: .touchUpInside)
        
        let rightLB1 = UILabel()
        rightLB1.text = ">"
        rightLB1.textColor = .black
        
        let rightLB2 = UILabel()
        rightLB2.text = ">"
        rightLB2.textColor = .black
        
        let rightLB3 = UILabel()
        rightLB3.text = ">"
        rightLB3.textColor = .black
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightLB1),
                                                   UIBarButtonItem(customView: rightLB2),
                                                   UIBarButtonItem(customView: rightLB3),
                                                   UIBarButtonItem(customView: pushBtn)]
        
        self.navigationItem.title = "HomeView"
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heightArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        
        if indexPath.row < 10 {
            cell.titleLB.text = "\(indexPath.row) long"
        }else {
            cell.titleLB.text = "\(indexPath.row) long long long long long long long long long long long"
        }
        
        if heightArray[indexPath.row] {
            cell.titleLB.numberOfLines = 0
        }else {
            cell.titleLB.numberOfLines = 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//
//        self.navigationController?.pushViewController(pushVC, animated: true)
        
        if heightArray[indexPath.row] {
            heightArray[indexPath.row] = false
            
        }else {
            heightArray[indexPath.row] = true
            
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    @objc func pushButtonHandler(_ sender: UIButton) {
        goToNextVC()
    }

    private func goToNextVC() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func nextAction() {
        let nextVC = UIViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func popAction() {
        let popVC = UIViewController()
        self.navigationController?.popToViewController(popVC, animated: true)
    }

}

