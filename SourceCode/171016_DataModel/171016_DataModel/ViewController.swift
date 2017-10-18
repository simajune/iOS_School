//
//  ViewController.swift
//  171016_DataModel
//
//  Created by SIMA on 2017. 10. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userDic: [UserModel]?
    var albumModel: AlbumModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "UserPlist", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                //code...
                print(dic)
            let userDataModel = UserModel(dataDic: dic)
            print(userDataModel?.userID)
            
        }
        
        
        
        let list = [["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1],
                   ["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1],
                   ["userID" : "Jung", "userPW" : "12345", "userEmail" : "simatj@nate.com", "birthday" : "1987/05/07", "gender" : 1]]
        
        
        for dic in list {
            userDic?.append(UserModel(dataDic: dic)!)
        }
        
        let album:Dictionary<String,Any> =
            ["albumInfo":["albumTitle":"2집 Oh!",
                          "artist":"소녀시대",
                          "genre":"댄스"],
             "songList":[["songTitle":"Oh!",
                          "trackNum":1,
                          "artist":"소녀시대",
                          "writer":"김정배",
                          "playTime":12340,
                          "playURL":"http://music.naver.com/123"],
                         ["songTitle":"Show! Show! Show!",
                          "trackNum":2,
                          "artist":"소녀시대",
                          "writer":"김부민",
                          "playTime":10130,
                          "playURL":"http://music.naver.com/124"],
                         ["songTitle":"웃자 (Be Happy)",
                          "trackNum":4,
                          "artist":"소녀시대",
                          "writer":"이트라이브",
                          "playTime":12134,
                          "playURL":"http://music.naver.com/126"]
                ]
        ]
        
        albumModel = AlbumModel(albumModel: album)
        test()
        
        
    }
    
    func test() {
        print(albumModel!.albumInfo.albumTitle)
        print(albumModel!.songList[0].artist)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

