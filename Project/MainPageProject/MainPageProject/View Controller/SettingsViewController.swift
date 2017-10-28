//
//  SettingsViewController.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 25..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var dataCenter: DataCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCenter = DataCenter()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataCenter?.settings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCenter?.settings[section].datas.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataCenter?.settings[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
        let settingItem = dataCenter?.settings[indexPath.section]
        let detailSettingItem = settingItem?.datas[indexPath.row]
        
        if let cellType = detailSettingItem?.cellStyle {
            switch cellType {
            case .settingDetailCell:
                cell.accessoryType = .disclosureIndicator
                cell.versionLb.isHidden = true
                cell.autoLoginSwitch.isHidden = true
            case .settingBasicCell:
                cell.versionLb.isHidden = true
                cell.autoLoginSwitch.isHidden = true
            case .settingNonButtonCell:
                cell.autoLoginSwitch.isHidden = true
                cell.selectionStyle = .none
                cell.versionLb.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
            case .settingSwitchCell:
                cell.versionLb.isHidden = true
            }
        }
        
        cell.textLabel?.text = detailSettingItem?.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingItem = dataCenter?.settings[indexPath.section]
        let detailItem = settingItem?.datas[indexPath.row]
        let titleName = detailItem?.content
        
        if titleName == "정보수정" {
            let editInfo = UIStoryboard(name: "Main", bundle: nil)
            let editVC = editInfo.instantiateViewController(withIdentifier: "EditInfo")
            self.navigationController?.pushViewController(editVC, animated: true)

        }else if titleName == "비밀번호변경" {
            performSegue(withIdentifier: "ChangePassword", sender: self)
        }else if titleName == "로그아웃" {
            let alertSheet = UIAlertController(title: "로그아웃", message: "정말로 로그아웃 하시겠습니까?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "예", style: .default, handler: { (action) in
                let LoginPage = UIStoryboard(name: "LoginFlow", bundle: nil)
                if let LoginVC = LoginPage.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController {
                    self.present(LoginVC, animated: true, completion: nil)
                }
            })
            let cancleAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            alertSheet.addAction(okAction)
            alertSheet.addAction(cancleAction)
            self.present(alertSheet, animated: true, completion: nil)
            
        }else if titleName == "회원탈퇴" {
            
        }
        
    }
    

}
