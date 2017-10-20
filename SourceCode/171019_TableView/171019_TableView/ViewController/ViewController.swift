//
//  ViewController.swift
//  171019_TableView
//
//  Created by SIMA on 2017. 10. 19..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
//MARK: - Variable
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataCenter.mainCenter.nameList.remove(at: indexPath.row)
            DataCenter.mainCenter.saveNameList()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(GirlGroupDataCenter.mainCenter.Nickname[indexPath.row])를 눌렀습니다.")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return DataCenter.mainCenter.nameList.count
        return GirlGroupDataCenter.mainCenter.membersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let name = DataCenter.mainCenter.nameList[indexPath.row]
//        cell.textLabel?.text = name
//        cell.imageView?.image = UIImage(named: "ProfileImage1")
//        cell.accessoryType = .disclosureIndicator
//        cell.textLabel?.numberOfLines = 0
//        return cell
        
        
        let nickName = GirlGroupDataCenter.mainCenter.Nickname[indexPath.row]
        let profileImage = GirlGroupDataCenter.mainCenter.ProfileImage[indexPath.row]
        let myProfileDescription = GirlGroupDataCenter.mainCenter.MyProfileDescription[indexPath.row]
        
        cell.textLabel?.text = nickName
        cell.detailTextLabel?.isEnabled = true
        cell.detailTextLabel?.text = myProfileDescription
        
        cell.imageView?.image = UIImage(named: profileImage)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.accessoryType = .disclosureIndicator
        cell.accessoryType = .checkmark
        
        return cell
        
    }


}

