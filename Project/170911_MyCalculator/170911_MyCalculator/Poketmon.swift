//
//  Chu.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Chu {
    var name: String = ""
    var revolution: [String] = ["Pichu", "Pikachu", "Raichu"]
    var hp: Int = 100
    var level: Int = 1
    var exp: Double = 0
    var str: Int = 20
    var dex: Int = 10
    var def: Int = 15
    var skill: [String] = ["공격", "막기", "전광석화", "회피하기", "백만볼트", "꼬리치기"]
    var item: String = ""
    
    let type: String = "thunder"
    let needExp: [Int] = [10, 30, 50]
    
    init (name: String){
        self.name = name
    }
    
    init () {
        
    }
    
    func attack (strength: Int) {
        
    }
    
    func damaged(def: Int, enemyDamage: Int) {
        
    }
    
    func miss(dex: Int , enemyDex: Int) {
        
    }
    
    func addSkill(level: Int) {
        
    }
    
    func addSkill(item: String) {
        
    }
    
    func removeSkill(skillNum: Int) {
        
    }
}

class isanghae {
    var name: String = ""
    var revolution: [String] = ["ssi", "pul", "ggo-ot"]
    var hp: Int = 100
    var level: Int = 1
    var exp: Double = 0
    var str: Int = 20
    var dex: Int = 5
    var def: Int = 10
    var skill: [String] = ["씨뿌리기", "일반공격", "태양광선", "풀잎베기", "채찍치기"]
    var button: Bool = true
    
    let type: String = "leap"
    let needExp: [Int] = [10, 30, 50]
    
    init (name: String){
        self.name = name
    }
    
    func attack (strength: Int) {
        
    }
    
    func damaged(def: Int, enemyDamage: Int) {
        
    }
    
    func miss(dex: Int , enemyDex: Int) {
        
    }
    
    func addSkill(level: Int) {
        
    }
    
    func removeSkill(skillNum: Int) {
        
    }
    
    func isRevolution(level: Int) {
        
    }
    
    func cancelRevolution(button: Bool) {
        
    }
    
    func potion (heathpotion: Bool) {
        
    }
    
}

class turtle {
    var name: String = ""
    var revolution: [String] = ["ggo", "uhni", "guh-buk"]
    var hp: Int = 100
    var level: Int = 1
    var exp: Double = 0
    var str: Int = 20
    var dex: Int = 10
    var def: Int = 15
    var skill: [String] = ["일반공격", "물대포", "웅크리기", "하이드로펌프"]
    
    let type: String = "water"
    let needExp: [Int] = [10, 30, 50]
    
    init (name: String){
        self.name = name
    }
    
    func attack (strength: Int) {
        
    }
    
    func damaged(def: Int, enemyDamage: Int) {
        
    }
    
    func miss(dex: Int , enemyDex: Int) {
        
    }
    
    func addSkill(level: Int) {
        
    }
    
    func removeSkill(skillNum: Int) {
        
    }
}
