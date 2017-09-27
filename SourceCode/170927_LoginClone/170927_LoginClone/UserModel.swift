//
//  UserModel.swift
//  170927_LoginClone
//
//  Created by SIMA on 2017. 9. 27..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

final class UserModel {
    
    var model: [User] = [
        User.init(username: "FAST", password: "asd"),
        User.init(username: "CAMPUS", password: "123"),
        User.init(username: "IOS", password: "321")
    ]
    
    struct User {
        var username: String
        var password: String
        
    }
    
    func isPresenceUser (name: String) -> Bool {
        for user in model {
            if user.username == name {
                return true
            }
        }
        return false
    }
    
    func findUser(name: String, password: String) -> Bool {
        for user in model {
            if user.username == name && user.password == password {
                return true
            }
        }
        return false
    }
    
    func addUser (name: String, password: String) {
        let newUser = User(username: name, password: password)
        model.append(newUser)
    }
    
    
}
